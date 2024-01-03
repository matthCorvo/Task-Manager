import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { TacheService } from '../../services/tache.service';

@Component({
  selector: 'app-edit-tache',
  templateUrl: './edit-tache.component.html',
  styleUrls: ['./edit-tache.component.css']
})
export class EditTacheComponent implements OnInit {
  constructor(private tacheService: TacheService, private route: ActivatedRoute, private router: Router) { }
  listeId: number = 0;
  tacheId: number = 0;
  tacheTitre: string = '';

  ngOnInit() {
    this.route.params.subscribe(
      (params: Params) => {
        this.listeId = params['listeId'];
        this.tacheId = params['tacheId'];
        console.log(params['listeId']);
        console.log(params['tacheId']);
        // Récupérez les données d'origine de la liste 
        this.fetchOriginalListData(this.listeId, this.tacheId );
  }
);
}

fetchOriginalListData(listeId: number, tacheId: number) {
this.tacheService.getTache(listeId,tacheId ).subscribe(
  (tacheData: any) => {
    this.tacheTitre = tacheData.titre;
  },
  (error: any) => {
    console.error('Erreur lors de la récupération des données', error);
  }
);
}
 
updateTask() {
    const titre = this.tacheTitre;
    this.tacheService.updateTache(this.listeId, this.tacheId, titre).subscribe(( )=> {
      this.router.navigate([ '/liste', this.listeId]); 
    })  
  }
}
