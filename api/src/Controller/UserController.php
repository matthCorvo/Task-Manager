<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Gesdinet\JWTRefreshTokenBundle\Model\RefreshTokenManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\SecurityBundle\Security;

#[Route('/api')]
class UserController extends AbstractController
{
    #[Route('/signup', name: 'signup', methods: ['POST'])]
    public function signup(
        UserRepository $userRepository,
        SerializerInterface $serializer,
        EntityManagerInterface $em,
        Request $request,
        UserPasswordHasherInterface $userPasswordHasher,
        JWTTokenManagerInterface $JWTManager
    ): JsonResponse {
        // Deserialize the JSON request into a User object
        $user = $serializer->deserialize($request->getContent(), User::class, 'json');

        // Get email and password from the User object
        $email = $user->getEmail();
        $password = $user->getPassword();
        // Check if email or password is empty
        if (empty($email) || empty($password)) {
            return new JsonResponse(['message' => 'Email and password are required'], Response::HTTP_BAD_REQUEST);
        }

         // Check if the user with the provided email already exists
                $existingUser = $userRepository->findOneByEmail($email);

                if ($existingUser) {
                    return new JsonResponse(['message' => 'Email already exists'], Response::HTTP_BAD_REQUEST);
                }
        
        // Create a new User entity
        $user = new User();
        $user->setEmail($email);
        $user->setRoles(["ROLE_USER"]);
        $user->setPassword($userPasswordHasher->hashPassword($user, $password));
 
       
        // Persist and flush the User entity to the database
        $em->persist($user);
        $em->flush();

        // Generate a JWT token for the new user
        $token = $JWTManager->create($user);

        return new JsonResponse(['token' => $token], Response::HTTP_CREATED);
    }

    #[Route('/login', name: 'login', methods: ['POST'])]
    public function login(        
        JWTTokenManagerInterface $JWTManager,    
        Request $request, 
        RefreshTokenManagerInterface $refreshTokenManager,
        UserRepository $userRepository,
        UserPasswordHasherInterface $userPasswordHasher
    ) {
        // Get the user's credentials from the request (e.g., email and password)
        $credentials = json_decode($request->getContent(), true);
        $email = $credentials['email'] ?? null;
        $password = $credentials['password'] ?? null;

        // Check if email or password is missing
        if (empty($email) || empty($password)) {
            return new JsonResponse(['message' => 'Email and password are required'], Response::HTTP_BAD_REQUEST);
        }

        // Find the user by email
        $user = $userRepository->findOneByEmail($email);

        // Check if a user with the provided email exists
        if (!$user) {
            return new JsonResponse(['message' => 'User not found'], Response::HTTP_UNAUTHORIZED);
        }

        // Check if the provided password is correct
        if (!$userPasswordHasher->isPasswordValid($user, $password)) {
            return new JsonResponse(['message' => 'Invalid credentials'], Response::HTTP_UNAUTHORIZED);
        }

        // Generate a JWT token for the authenticated user
        $token = $JWTManager->create($user);

        return new JsonResponse(['token' => $token], Response::HTTP_CREATED);
    }


    /**
     * @param User $user
     * @param JWTTokenManagerInterface $JWTManager
     * @return JsonResponse
     */
    #[Route('/token', name: 'token', methods: ['GET'])]
    public function getTokenUser(Security $security, JWTTokenManagerInterface $JWTManager)
    {
        $user = $security->getUser();

        return new JsonResponse(['token' => $JWTManager->create($user)]);
    }

    #[Route('/users', name: 'list_users', methods: ['GET'])]
    #[IsGranted('ROLE_ADMIN', message: 'Vous n\'avez pas les droits suffisants pour créer un livre')]
    public function listUsers(EntityManagerInterface $entityManager): JsonResponse
    {
        // Get the UserRepository
        $userRepository = $entityManager->getRepository(User::class);

        // Retrieve all users from the database
        $users = $userRepository->findAll();

        // Serialize the list of users to JSON
        $data = [];
        foreach ($users as $user) {
            $data[] = [
                'id' => $user->getId(),
                'email' => $user->getEmail(),
                'roles' => $user->getRoles(),
            ];
        }

        // Return the JSON response with the list of users
        return new JsonResponse(['users' => $data]);
    }


    // #[Route('/api/token/refresh', name: 'token_refresh', methods: ['GET'])]
    // public function refreshTokenAction()
    // {
    //     // Your controller logic here
    // }
}
