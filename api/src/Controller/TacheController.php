<?php

namespace App\Controller;

use App\Entity\Tache;
use App\Repository\ListeRepository;
use App\Repository\TacheRepository;
use Doctrine\ORM\EntityManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

#[Route('/api/liste')]
// #[IsGranted('IS_AUTHENTICATED_FULLY', message: 'Vous n\'avez pas les droits suffisants pour créer un livre')]
class TacheController extends AbstractController
{
    #[Route('/{listeId}/tache', name: 'TacheByListeId', methods: ['GET'])]
    public function GetTacheByListeId(int $listeId,TacheRepository $tacheRepository,  SerializerInterface $serializer): JsonResponse
    {
        // Récupérez toutes les tâches appartenant à une liste spécifique (listId)
        $tache = $tacheRepository->findBy(['liste' => $listeId]);    
        // Sérialisez les tâches en JSON
        $jsonListe = $serializer->serialize($tache, 'json', ['groups' => 'getTache']);
        return new JsonResponse($jsonListe, Response::HTTP_OK, [], true);
    }

    #[Route('/{listeId}/tache/{id}', name: 'TacheById', methods: ['GET'])]
    public function GetTacheById(Tache $tache,  SerializerInterface $serializer): JsonResponse
    {
        $jsonTache = $serializer->serialize($tache, 'json', ['groups' => 'getTache']);
        return new JsonResponse($jsonTache, Response::HTTP_OK, ['accept' => 'json'], true);
    }

    #[Route('/{listeId}/tache', name: 'createTache', methods: ['POST'])]
    public function createTache(ValidatorInterface $validator, Request $request, SerializerInterface $serializer, EntityManagerInterface $em, UrlGeneratorInterface $urlGenerator, ListeRepository $listeRepository, int $listeId): JsonResponse
    {
        // Désérialize the task from the JSON request data
        $tache = $serializer->deserialize($request->getContent(), Tache::class, 'json');
          // On vérifie les erreurs
          $errors = $validator->validate($tache);

          if ($errors->count() > 0) {
              return new JsonResponse($serializer->serialize($errors, 'json'), JsonResponse::HTTP_BAD_REQUEST, [], true);
          }
          
        // Set the associated liste using the provided $listeId
        $liste = $listeRepository->find($listeId);
        if (!$liste) {
            // Handle the case where the liste with the given ID doesn't exist
            return new JsonResponse(['error' => 'Liste non trouvée'], Response::HTTP_NOT_FOUND);
        }
        
        $tache->setListe($liste);

        // Persist the new task
        $em->persist($tache);
        $em->flush();

        // Serialize the created task to JSON
        $jsonTache = $serializer->serialize($tache, 'json', ['groups' => 'getTache']);

        // Generate the location of the created task
        $location = $urlGenerator->generate('TacheById', ['listeId' => $listeId, 'id' => $tache->getId()], UrlGeneratorInterface::ABSOLUTE_URL);

        // Return a JSON response with the location of the created task
        return new JsonResponse($jsonTache, Response::HTTP_CREATED, ["Location" => $location], true);
    }

    #[Route('/{listeId}/tache/{id}', name: 'updateTache', methods: ['PATCH'])]
    public function updateTache(Request $request, SerializerInterface $serializer, Tache $currentTache, EntityManagerInterface $em): JsonResponse 
    {
        $updateTache = $serializer->deserialize($request->getContent(), 
                Tache::class, 
                'json', 
                [AbstractNormalizer::OBJECT_TO_POPULATE => $currentTache]);
        
        $em->persist($updateTache);
        $em->flush();
        return new JsonResponse(null, JsonResponse::HTTP_NO_CONTENT);
    }
    
    #[Route('/{listeId}/tache/{id}', name: 'deleteTache', methods: ['DELETE'])]
    public function deleteTache(Tache $tache, EntityManagerInterface $em): JsonResponse 
    {
        $em->remove($tache);
        $em->flush();

        return new JsonResponse(null, Response::HTTP_NO_CONTENT);
    }
}
