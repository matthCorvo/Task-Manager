<?php

namespace App\Controller;

use App\Entity\Liste;
use App\Entity\User;
use App\Repository\ListeRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\SecurityBundle\Security;

#[Route('/api')]
#[IsGranted('IS_AUTHENTICATED_FULLY', message: 'Vous n\'avez pas les droits suffisants pour créer un livre')]
class ListeController extends AbstractController
{
    /**
     * Obtient toutes les listes associées à l'utilisateur authentifié.
     *
     * @param Security $security
     * @param ListeRepository $listeRepository
     * @param SerializerInterface $serializer
     * @return JsonResponse
     */
    #[Route('/liste', name: 'AllListe', methods: ['GET'])]
    public function GetAllListe( Security $security, ListeRepository $listeRepository,  SerializerInterface $serializer): JsonResponse
    {
        // Obtient l'utilisateur authentifié
        $user = $security->getUser();
    
        // Récupère les listes associées à l'utilisateur authentifié
        $liste = $listeRepository->findBy(['user' => $user]);
        $jsonListe = $serializer->serialize($liste, 'json', ['groups' => 'getTache']);
        return new JsonResponse($jsonListe, Response::HTTP_OK, ['accept' => 'json'], true);
    }

     /**
     * Obtient une liste par son ID.
     *
     * @param SerializerInterface $serializer
     * @param Liste $liste
     * @return JsonResponse
     */
    #[Route('/liste/{id}', name: 'ListeById', methods: ['GET'])]
    public function GetListeById( SerializerInterface $serializer, Liste $liste): JsonResponse 
    {
        $jsonListe = $serializer->serialize($liste, 'json', ['groups' => 'getTache']);
        return new JsonResponse($jsonListe, Response::HTTP_OK, ['accept' => 'json'], true);
    }

     /**
     * Crée une nouvelle liste pour l'utilisateur authentifié.
     *
     * @param Security $security
     * @param ValidatorInterface $validator
     * @param Request $request
     * @param SerializerInterface $serializer
     * @param EntityManagerInterface $em
     * @param UrlGeneratorInterface $urlGenerator
     * @return JsonResponse
     */
    #[Route('/liste', name:"createListe", methods: ['POST'])]
    public function createListe( Security $security, ValidatorInterface $validator, Request $request, SerializerInterface $serializer, EntityManagerInterface $em, UrlGeneratorInterface $urlGenerator): JsonResponse 
    {
        $user = $security->getUser();

        if (!$user) {
            return new JsonResponse(['message' => 'User not authenticated'], JsonResponse::HTTP_UNAUTHORIZED);
        }
    
        // Crée une nouvelle instance de Liste
        $liste = $serializer->deserialize($request->getContent(), Liste::class, 'json');
    
        // Associe l'utilisateur authentifié à la Liste
        $liste->setUser($user);
    
        // Vérifie les erreurs de validation
        $errors = $validator->validate($liste);

        if ($errors->count() > 0) {
            return new JsonResponse($serializer->serialize($errors, 'json'), JsonResponse::HTTP_BAD_REQUEST, [], true);
        }
        
        $em->persist($liste);
        $em->flush();

        $jsonListe = $serializer->serialize($liste, 'json', ['groups' => 'getTache']);
        
        $location = $urlGenerator->generate('ListeById', ['id' => $liste->getId()], UrlGeneratorInterface::ABSOLUTE_URL);

        return new JsonResponse($jsonListe, Response::HTTP_CREATED, ["Location" => $location], true);
    }

    /**
     * Met à jour une liste existante.
     *
     * @param Request $request
     * @param SerializerInterface $serializer
     * @param Liste $currentListe
     * @param EntityManagerInterface $em
     * @return JsonResponse
     */
    #[Route('/liste/{id}', name:"updateListe", methods:['PATCH'])]
    public function updateListe(Request $request, SerializerInterface $serializer, Liste $currentListe, EntityManagerInterface $em): JsonResponse 
    {
        $updateListe = $serializer->deserialize($request->getContent(), 
                Liste::class, 
                'json', 
                [AbstractNormalizer::OBJECT_TO_POPULATE => $currentListe]);
        
        $em->persist($updateListe);
        $em->flush();
        return new JsonResponse(null, JsonResponse::HTTP_NO_CONTENT);
    }

     /**
     * Supprime une liste.
     *
     * @param Liste $liste
     * @param EntityManagerInterface $em
     * @return JsonResponse
     */
    #[Route('/liste/{id}', name: 'deleteListe', methods: ['DELETE'])]
    public function deleteListe(Liste $liste, EntityManagerInterface $em): JsonResponse 
    {
        $em->remove($liste);
        $em->flush();

        return new JsonResponse(null, Response::HTTP_NO_CONTENT);
    }

}
