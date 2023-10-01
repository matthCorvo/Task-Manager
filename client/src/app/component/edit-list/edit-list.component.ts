import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { TacheService } from 'src/app/services/tache.service';

@Component({
  selector: 'app-edit-list',
  templateUrl: './edit-list.component.html',
  styleUrls: ['./edit-list.component.css']
})
export class EditListComponent implements OnInit {

  constructor(private tacheService: TacheService, private route: ActivatedRoute, private router: Router) { }
  listeId: number = 0;
  listeTitre: string = '';

  ngOnInit() {
    this.route.params.subscribe(
      (params: Params) => {
        this.listeId = params['listeId'];
        console.log(params['listeId']);
        // Récupérez les données d'origine de la liste 
        this.fetchOriginalListData(this.listeId);
  });
}

fetchOriginalListData(listeId: number) {

this.tacheService.GetListe(listeId).subscribe(
  (listeData: any) => {
    this.listeTitre = listeData.titre;
  },
  (error: any) => {
    console.error('Erreur lors de la récupération des données', error);
  }
);
}
 
  updateList() {
    const titre = this.listeTitre;
    this.tacheService.updateListe(this.listeId, titre).subscribe(( )=> {
      this.router.navigate([ '/liste', this.listeId]); 
    })  
  }
}
