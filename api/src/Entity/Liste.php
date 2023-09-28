<?php

namespace App\Entity;

use App\Repository\ListeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: ListeRepository::class)]
class Liste
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(["getTache"])]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(["getTache"])]
    private ?string $titre = null;

    #[ORM\OneToMany(mappedBy: 'liste', targetEntity: Tache::class, cascade:['remove'])]
    private Collection $taches;

    public function __construct()
    {
        $this->taches = new ArrayCollection();
    }

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

    /**
     * @return Collection<int, Tache>
     */
    public function getTaches(): Collection
    {
        return $this->taches;
    }

    public function addTach(Tache $taches): static
    {
        if (!$this->taches->contains($taches)) {
            $this->taches->add($taches);
            $taches->setListe($this);
        }

        return $this;
    }

    public function removeTach(Tache $taches): static
    {
        if ($this->taches->removeElement($taches)) {
            // set the owning side to null (unless already changed)
            if ($taches->getListe() === $this) {
                $taches->setListe(null);
            }
        }

        return $this;
    }
}
