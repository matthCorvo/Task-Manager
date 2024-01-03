import { Injectable } from '@angular/core';
import { WebRequestService } from './web-request.service';
import { Router } from '@angular/router';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { shareReplay, tap, map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private webService: WebRequestService, private router: Router, private http: HttpClient) { }
  
  // Fonction de connexion de l'utilisateur
  login(username: string, password: string) {
    return this.webService.login(username, password).pipe(
      shareReplay(),
      tap((res: HttpResponse<any>) => {
        console.log('Login Response:', res);
        const accessToken = res.body?.token;
        const refreshToken = res.body?.refreshToken;

        if (accessToken) {
          this.setSession( accessToken, refreshToken);
        } else {
          console.error('Access Token is missing in the response body.');
        }

      console.log('LOGGED IN!');
      })
    );
  }

    // Fonction d'inscription de l'utilisateur
  signup(email: string, password: string) {
    return this.webService.signup(email, password).pipe(
      shareReplay(),
      tap((res: HttpResponse<any>) => {
        console.log('Login Response:', res);
        const accessToken = res.body?.token;
        // Les jetons d'authentification seront dans l'en-tête de cette réponse
        this.setAccessToken(accessToken);
        console.log("Successfully signed up and now logged in!");
      })
    )
  }

  // Fonction de déconnexion de l'utilisateur
  logout() {
    this.removeSession();
    this.router.navigate(['/login']);
  }

  // Fonction pour obtenir le jeton d'accès
  getAccessToken() {
    return localStorage.getItem('x-access-token');
  }

  // Fonction pour obtenir le jeton de rafraîchissement
  getRefreshToken() {
    return localStorage.getItem('x-refresh-token');
  }

  // Fonction pour définir le jeton de rafraîchissement
  setRefreshToken(refreshToken: string) {
    localStorage.setItem('x-refresh-token', refreshToken);
  }

  // Fonction pour définir le jeton d'accès
  setAccessToken(accessToken: string) {
    localStorage.setItem('x-access-token', accessToken)
  }
  // Fonction privée pour définir à la fois le jeton d'accès et le jeton de rafraîchissement
  private setSession( accessToken: string, refreshToken: string) {
    localStorage.setItem('x-access-token', accessToken);
    localStorage.setItem('x-refresh-token', refreshToken);
  }
  
  // Fonction privée pour supprimer les jetons de session
  private removeSession() {
    localStorage.removeItem('x-access-token');
    localStorage.removeItem('x-refresh-token');
  }

 // Fonction pour obtenir un nouveau jeton d'accès à partir du jeton de rafraîchissement
getNewAccessToken() {
  const refreshToken = this.getRefreshToken() ?? '';
  
  return this.http.get(`${this.webService.ROOT_URL}/token`, {
      headers: {
      'x-refresh-token': refreshToken,
      },
      observe: 'response'
     })
    .pipe(
      tap((res: HttpResponse<any>) => {
        const accessToken = res.headers.get('x-access-token') ?? '';
        this.setAccessToken(accessToken);
      })
   )
  }

}
