<?php

namespace App\Controller;

use App\Entity\Liste;
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
    #[Route('/liste', name: 'AllListe', methods: ['GET'])]
    public function GetAllListe(Security $security, ListeRepository $listeRepository,  SerializerInterface $serializer): JsonResponse
    {
        // Get the authenticated user
        $user = $security->getUser();
    
        // Check if the user is authenticated
        if (!$user) {
            return new JsonResponse(['message' => 'User not authenticated'], JsonResponse::HTTP_UNAUTHORIZED);
        }
    
        // Retrieve lists associated with the authenticated user
        $liste = $listeRepository->findBy(['user' => $user]);
        $jsonListe = $serializer->serialize($liste, 'json', ['groups' => 'getTache']);
        return new JsonResponse($jsonListe, Response::HTTP_OK, [], true);
    }

    #[Route('/liste/{id}', name: 'ListeById', methods: ['GET'])]
    public function GetListeById( SerializerInterface $serializer, Liste $liste): JsonResponse 
    {
        $jsonListe = $serializer->serialize($liste, 'json', ['groups' => 'getTache']);
        return new JsonResponse($jsonListe, Response::HTTP_OK, ['accept' => 'json'], true);

    }

    #[Route('/liste', name:"createListe", methods: ['POST'])]
    public function createListe( UserRepository $userRepository, ValidatorInterface $validator, Request $request, SerializerInterface $serializer, EntityManagerInterface $em, UrlGeneratorInterface $urlGenerator): JsonResponse 
    {

        $liste = $serializer->deserialize($request->getContent(), Liste::class, 'json');
        $content = $request->toArray();
        // Get the authenticated user's ID
        $userId = $content['userId'] ?? -1;

        // On cherche l'auteur qui correspond et on l'assigne au livre.
        // Si "find" ne trouve pas l'auteur, alors null sera retourné.
        $liste->setUser($userRepository->find($userId));
        if (!$userId) {
            return new JsonResponse(['message' => 'User not found'], JsonResponse::HTTP_NOT_FOUND);
        }

        // On vérifie les erreurs
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

    #[Route('/liste/{id}', name: 'deleteListe', methods: ['DELETE'])]
    public function deleteListe(Liste $liste, EntityManagerInterface $em): JsonResponse 
    {
        $em->remove($liste);
        $em->flush();

        return new JsonResponse(null, Response::HTTP_NO_CONTENT);
    }

}
