import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Tache } from '../../models/tache.models';
import { TacheService } from 'src/app/services/tache.service';

@Component({
  selector: 'app-new-task',
  templateUrl: './new-task.component.html',
  styleUrls: ['./new-task.component.css']
})
export class NewTaskComponent implements OnInit{

  constructor(private tacheService: TacheService, private route: ActivatedRoute, private router: Router) { }
  
  listeId: number = 0;

ngOnInit() {
    this.route.params.subscribe(
      (params: Params) => {
        this.listeId = params['listeId'];
      }
    )
  }


  createNewTask(titre: string) {
    this.tacheService.createTache(titre, this.listeId).subscribe(newTask => {
      const tache: Tache = newTask as Tache;
      console.log(tache)
      this.router.navigate(['../'], { relativeTo: this.route });
    })
  }
}
