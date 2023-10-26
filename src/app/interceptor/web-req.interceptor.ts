import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError, empty, Subject } from 'rxjs';
import { AuthService } from '../services/auth.service';
import { catchError, tap, switchMap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class WebReqInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService) { }

  refreshingAccessToken: boolean = false;
  //  utilisé pour signaler que le jeton d'accès a été rafraîchi
  private accessTokenRefreshed: Subject<any> = new Subject();

  // Intercepte les requêtes HTTP sortantes
  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<any> {
    // Ajoute le jeton d'authentification aux en-têtes de la requête
    request = this.addAuthHeader(request);
    return next.handle(request).pipe(
      catchError((error: HttpErrorResponse) => {
        console.log(error);

        if (error.status == 401) {
        // En cas d'erreur 401 (non autorisé), tente de rafraîchir le jeton d'accès
           return this.refreshAccessToken()
            .pipe(
              switchMap(() => {
                // Après le rafraîchissement du jeton, réessaie la requête
                request = this.addAuthHeader(request);
                return next.handle(request);
              }),
              catchError((err: any) => {
            console.log(err)
              // En cas d'échec du rafraîchissement du jeton, déconnecte l'utilisateur
                this.authService.logout();
                return empty();
              })
            )
        }

        return throwError(error);
      })
    )
  }

  // Rafraîchit le jeton d'accès
  refreshAccessToken() {
    if (this.refreshingAccessToken) {
      return new Observable(observer => {
        this.accessTokenRefreshed.subscribe(() => {
          // Ce code s'exécutera lorsque le jeton d'accès aura été rafraîchi
          observer.next();
          observer.complete();
        })
      })
    } else {
      this.refreshingAccessToken = true;
      return this.authService.getNewAccessToken().pipe(
        tap(() => {
          console.log("Access Token Refreshed!");
          this.refreshingAccessToken = false;
          // Signale que le jeton d'accès a été rafraîchi
          this.accessTokenRefreshed.next(true);
        })
      )
    }
    
  }

  // Ajoute le jeton d'authentification aux en-têtes de la requête
  addAuthHeader(request: HttpRequest<any>) {
    // Obtient le jeton d'accès
    const token = this.authService.getAccessToken();
    if (token) {
      // Ajoute le jeton d'accès aux en-têtes de la requête
      return request.clone({
        setHeaders: {
          'Authorization': `Bearer ${token}`
        }
      })
    }
    return request;
  }

}