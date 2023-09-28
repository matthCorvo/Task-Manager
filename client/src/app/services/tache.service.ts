import { Injectable } from '@angular/core';
import { WebRequestService } from './web-request.service';
import { Tache } from '../models/tache.models';

@Injectable({
  providedIn: 'root'
})

export class TacheService {

  constructor(private webReqService: WebRequestService) { }

  getAllListe() {
    return this.webReqService.get('liste');
  }

  createListe(titre: string) {
    // We want to send a web request to create a list
    return this.webReqService.post('liste', { titre });
  }

  GetListeId(id: number) {
    return this.webReqService.get(`liste/${id}/tache`);
  }

  updateListe(id: number, titre: string) {
    // We want to send a web request to update a list
    return this.webReqService.patch(`liste/${id}`, { titre });
  }

  updateTache(listeId: number, tacheId: number, titre: string) {
    // We want to send a web request to update a list
    return this.webReqService.patch(`liste/${listeId}/tache/${tacheId}`, { titre });
  }

  deleteTache(listeId: number, tacheId: number) {
    return this.webReqService.delete(`liste/${listeId}/tache/${tacheId}`);
  }

  deleteListe(id: number) {
    return this.webReqService.delete(`liste/${id}`);
  }

  GetTacheByListeId(listeId: number) {
    return this.webReqService.get(`liste/${listeId}/tache`);
  }

  createTache(titre: string, listeId: number) {
    // We want to send a web request to create a task
    return this.webReqService.post(`liste/${listeId}/tache`, { titre });
  }

  status(tache: Tache) {
    return this.webReqService.patch(`liste/${tache.liste.id}/tache/${tache.id}`, {
      status: !tache.status
    });
  }
}
