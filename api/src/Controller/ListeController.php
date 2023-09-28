<?php

namespace App\Controller;

use App\Entity\Liste;
use App\Repository\ListeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\SerializerInterface;

#[Route('/api')]
class ListeController extends AbstractController
{
    #[Route('/liste', name: 'AllListe', methods: ['GET'])]
    public function GetAllListe(ListeRepository $listeRepository,  SerializerInterface $serializer): JsonResponse
    {
        $liste = $listeRepository->findAll();
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
    public function createListe(Request $request, SerializerInterface $serializer, EntityManagerInterface $em, UrlGeneratorInterface $urlGenerator): JsonResponse 
    {

        $liste = $serializer->deserialize($request->getContent(), Liste::class, 'json');
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
