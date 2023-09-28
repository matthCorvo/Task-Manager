import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Liste } from 'src/app/models/liste.model';
import { Tache } from 'src/app/models/tache.models';
// import { Liste } from 'src/app/models/liste.model';
// import { Tache } from 'src/app/models/tache.models';
import { TacheService } from 'src/app/services/tache.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})

export class HomeComponent implements OnInit {
  // liste: Liste[];
  liste: any;
  tache: any;

  constructor(private tacheService: TacheService, private route: ActivatedRoute, private router: Router) { }

  ngOnInit() {
   this.route.params.subscribe(
      (params: Params) => {
          this.tacheService.GetTacheByListeId(params['listeId']).subscribe((tache: any) => {
            this.tache = tache;
          })
        }
    )

    this.tacheService.getAllListe().subscribe((liste: any) => {
      this.liste = liste;
    })
    
  }

  tacheClick(tache: Tache ) {
    // we want to set the task to completed
    this.tacheService.status(tache).subscribe(() => {
      // the task has been set to completed successfully
      tache.status = !tache.status;
    })
  }

}
