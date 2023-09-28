<?php

namespace App\DataFixtures;

use App\Entity\Liste;
use App\Entity\Tache;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // Création d'une vingtaine de listes ayant pour titre
        for ($i = 0; $i < 10; $i++) {
            $liste = new Liste;
            $liste->setTitre('Test Liste ' . $i);
            $manager->persist($liste);

             // Création de tâches pour chaque liste
             for ($j = 0; $j < 5; $j++) {
                $tache = new Tache();
                $tache->setTitre('Tâche ' . $j . ' de la liste ' . $i);
                $tache->setStatus(false); 
                $tache->setListe($liste); 
                $manager->persist($tache);
            }
        }

        $manager->flush();
    }
}
