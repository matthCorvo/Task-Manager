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
    return this.webReqService.post('liste', { titre });
  }

  GetListe(id: number) {
    return this.webReqService.get(`liste/${id}`);
  }

  GetListeId(id: number) {
    return this.webReqService.get(`liste/${id}/tache`);
  }

  updateListe(id: number, titre: string) {
    return this.webReqService.patch(`liste/${id}`, { titre });
  }

  updateTache(listeId: number, tacheId: number, titre: string) {
    return this.webReqService.patch(`liste/${listeId}/tache/${tacheId}`, { titre });
  }

  getTache(listeId: number, tacheId: number) {
    return this.webReqService.get(`liste/${listeId}/tache/${tacheId}`);
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
    return this.webReqService.post(`liste/${listeId}/tache`, { titre });
  }

  status(tache: Tache) {
    return this.webReqService.patch(`liste/${tache.liste.id}/tache/${tache.id}`, {
      status: !tache.status
    });
  }
}
