<?php

namespace App\Entity;

use App\Repository\TacheRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: TacheRepository::class)]
class Tache
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(["getTache"])]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(["getTache"])]
    #[Assert\NotBlank(message: "Le titre de la tache est obligatoire")]
    #[Assert\Length(min: 5, max: 255, minMessage: "Le titre doit faire au moins {{ limit }} caractères", maxMessage: "Le titre ne peut pas faire plus de {{ limit }} caractères")]
    private ?string $titre = null;

    #[ORM\Column(nullable: true)]
    #[Groups(["getTache"])]
    private ?bool $status = null;

    #[ORM\ManyToOne(inversedBy: 'taches')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(["getTache"])]
    private ?Liste $liste = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): static
    {
        $this->titre = $titre;

        return $this;
    }

    public function getStatus(): ?bool
    {
        return $this->status;
    }

    public function setStatus(?bool $status): static
    {
        $this->status = $status;

        return $this;
    }

    public function getListe(): ?Liste
    {
        return $this->liste;
    }

    public function setListe(?Liste $liste): static
    {
        $this->liste = $liste;

        return $this;
    }
}
