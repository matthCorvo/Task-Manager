import { Component, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Liste } from 'src/app/models/liste.model';
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
   // Fetch the original list data (e.g., using a service)
   this.fetchOriginalListData(this.listeId);
  }
);
}

// Fetch the original list data and set the listTitle property
fetchOriginalListData(listeId: number) {
// Replace this with your service call to fetch the original list data
// For example, assuming you have a service method called getListById(listeId)
this.tacheService.GetListe(listeId).subscribe(
  (listeData: any) => {
    // Assuming your original list data has a property 'title'
    this.listeTitre = listeData.titre;
  },
  (error: any) => {
    console.error('Error fetching original list data:', error);
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
