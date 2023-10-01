import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { TacheService } from 'src/app/services/tache.service';

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
   // Fetch the original list data (e.g., using a service)
   this.fetchOriginalListData(this.listeId, this.tacheId );
  }
);
}

// Fetch the original list data and set the listTitle property
fetchOriginalListData(listeId: number, tacheId: number) {
// Replace this with your service call to fetch the original list data
// For example, assuming you have a service method called getListById(listeId)
this.tacheService.getTache(listeId,tacheId ).subscribe(
  (tacheData: any) => {
    // Assuming your original list data has a property 'title'
    this.tacheTitre = tacheData.titre;
  },
  (error: any) => {
    console.error('Error fetching original list data:', error);
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
