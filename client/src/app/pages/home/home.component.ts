import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Tache } from 'src/app/models/tache.models';
import { TacheService } from 'src/app/services/tache.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})

export class HomeComponent implements OnInit {

  liste: any;
  tache: any;

  selectedListId: number = 0;

  constructor(private tacheService: TacheService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
  // Abonnez-vous aux changements des paramètres de l'URL
   this.route.params.subscribe(
      (params: Params) => {
        if (params['listeId']) {
          // S'il y a un paramètre 'listeId' dans l'URL, met à jour la liste sélectionnée
          this.selectedListId = params['listeId'];
          // Récupére les tâches de la liste sélectionnée
          this.tacheService.GetTacheByListeId(params['listeId']).subscribe((tache: any) => {
            this.tache = tache;
          })
        } else {
          // S'il n'y a pas de paramètre 'listeId' dans l'URL, réinitialise la liste de tâches
          this.tache = undefined;
        }
      }
    )
    // Récupérez toutes les listes de tâches disponibles
    this.tacheService.getAllListe().subscribe((liste: any) => {
      this.liste = liste;
    })
    
  }

  // Gestionnaire de clic pour marquer une tâche comme terminée ou non terminée
  tacheClick(tache: Tache ) {
    // Nous voulons définir l'état de la tâche comme terminée
    this.tacheService.status(tache).subscribe(() => {
      // La tâche a été définie comme terminée avec succès
      tache.status = !tache.status;
    })
  }

  // Gestionnaire de clic pour supprimer une liste
  onDeleteListClick() {
    this.tacheService.deleteListe(this.selectedListId).subscribe((res: any) => {
      // Redirigez l'utilisateur vers la page d'accueil après la suppression de la liste
      this.router.navigate(['/home']);
      console.log(res);
    })
  }

  // Gestionnaire de clic pour supprimer une tâche
  onDeleteTaskClick(tacheId: number) {
    this.tacheService.deleteTache(this.selectedListId, tacheId).subscribe((res: any) => {
      // Filtrez la tâche supprimée du tableau de tâches
      this.tache = this.tache.filter((val: Tache) => val.id !== tacheId);
      console.log(res);
    });
  }
  
}
