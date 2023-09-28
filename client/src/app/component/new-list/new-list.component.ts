import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Liste } from 'src/app/models/liste.model';
import { TacheService } from 'src/app/services/tache.service';

@Component({
  selector: 'app-new-list',
  templateUrl: './new-list.component.html',
  styleUrls: ['./new-list.component.css']
})
export class NewListComponent implements OnInit {

  constructor(private tacheService: TacheService, private route: ActivatedRoute, private router: Router) { }
  
 
  ngOnInit() {}

 
  createNewList(titre: string) {
    this.tacheService.createListe(titre).subscribe(next => {
      const liste: Liste = next as Liste;
      this.router.navigate([ '/liste', liste.id ]); 
    })  
  }
}
