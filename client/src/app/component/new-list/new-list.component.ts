import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Liste } from '../../models/liste.model';
import { TacheService } from '../../services/tache.service';

@Component({
  selector: 'app-new-list',
  templateUrl: './new-list.component.html',
  styleUrls: ['./new-list.component.css']
})
export class NewListComponent implements OnInit {
  constructor(private tacheService: TacheService, private route: ActivatedRoute, private router: Router) { }
  liste: Liste[] = [];

  ngOnInit() {
    // Assuming you have a method in your service to fetch lists
    this.fetchLists();
  }

  fetchLists() {
    this.tacheService.getAllListe().subscribe((liste: any) => {
      this.liste = liste;
    });
  }

  createNewList(titre: string) {
    this.tacheService.createListe(titre).subscribe((liste: any) => {
      console.log(liste);
      this.router.navigate(['/liste', liste.id]);
      this.fetchLists(); // Update the list after creating a new one
    });
  }
}
