import { Injectable } from '@angular/core';
import { WebRequestService } from './web-request.service';
import { Router } from '@angular/router';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { shareReplay, tap, map } from 'rxjs/operators';
import jwtDecode from 'jwt-decode';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private webService: WebRequestService, private router: Router, private http: HttpClient) { }

  login(username: string, password: string) {
    return this.webService.login(username, password).pipe(
      shareReplay(),
      tap((res: HttpResponse<any>) => {
        console.log('Login Response:', res);
        const accessToken = res.body?.token;
        const refreshToken = res.body?.refreshToken;

        if (accessToken) {
          // Decode the JWT to get the user ID
          this.setSession( accessToken, refreshToken);
        } else {
          console.error('Access Token is missing in the response body.');
        }

      console.log('LOGGED IN!');
      })
    );
  }
  
  signup(email: string, password: string) {
    return this.webService.signup(email, password).pipe(
      shareReplay(),
      tap((res: HttpResponse<any>) => {
        console.log('Login Response:', res);
        const accessToken = res.body?.token;
        // the auth tokens will be in the header of this response
        this.setAccessToken(accessToken);
        console.log("Successfully signed up and now logged in!");
      })
    )
  }

  logout() {
    this.removeSession();

    this.router.navigate(['/login']);
  }

  getAccessToken() {
    return localStorage.getItem('x-access-token');
  }
  
  getRefreshToken() {
    return localStorage.getItem('x-refresh-token');
  }

  // getUserId() {
  //   return localStorage.getItem('user-id');
  // }

  setRefreshToken(refreshToken: string) {
    localStorage.setItem('x-refresh-token', refreshToken);
  }

  
  setAccessToken(accessToken: string) {
    localStorage.setItem('x-access-token', accessToken)
  }

  private setSession( accessToken: string, refreshToken: string) {
    localStorage.setItem('x-access-token', accessToken);
    localStorage.setItem('x-refresh-token', refreshToken);
  }
  
  private removeSession() {
    localStorage.removeItem('x-access-token');
    localStorage.removeItem('x-refresh-token');
  }

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
