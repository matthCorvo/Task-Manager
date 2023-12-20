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
 
  ngOnInit() {}

 
  createNewList(titre: string) {
    this.tacheService.createListe(titre).subscribe((liste: any )=> {
      console.log(liste);
      this.router.navigate([ '/liste', liste.id ]); 
    })  
  }
}
