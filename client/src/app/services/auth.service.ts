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

  login(username: string, password: string) {
    return this.webService.login(username, password).pipe(
      shareReplay(),
      map((res: HttpResponse<any>) => {
        // Extract the response data here
        const data = res.body;
        return data; // Return the extracted data
      }),
      tap(data => {
        // Handle the extracted data
        this.setSession(data.id, data['x-access-token'] || '{}');
        console.log("LOGGED IN!");
      })
    );
  }

  logout() {
    this.removeSession();

    this.router.navigate(['/login']);
  }

  getAccessToken() {
    return localStorage.getItem('x-access-token');
  }

  setAccessToken(accessToken: string) {
    localStorage.setItem('x-access-token', accessToken)
  }

  private setSession(userId: string, accessToken: string) {
  // private setSession(userId: string, accessToken: string, refreshToken: string) {
    localStorage.setItem('user-id', userId);
    localStorage.setItem('x-access-token', accessToken);
    // localStorage.setItem('x-refresh-token', refreshToken);
  }
  
  private removeSession() {
    localStorage.removeItem('user-id');
    localStorage.removeItem('x-access-token');
    // localStorage.removeItem('x-refresh-token');
  }


}
