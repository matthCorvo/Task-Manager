import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Observable, throwError, empty, Subject } from 'rxjs';
import { AuthService } from '../services/auth.service';
import { catchError, tap, switchMap } from 'rxjs/operators'; 

@Injectable()
export class WebReqInterceptor implements HttpInterceptor {

  constructor(private authService: AuthService ) { }

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<any> {
    // Your intercept logic here
    request = this.addAuthHeader(request);

    return next.handle(request).pipe(
      catchError((error: HttpErrorResponse) => {
        console.log(error);
        if (error.status === 401) {
          // 401 error so we are unauthorized

                console.log('err');
                this.authService.logout();
       
        }
        return throwError(error);

      }) )
  }

    addAuthHeader(request: HttpRequest<any>) {
      // get the access token
      const token = this.authService.getAccessToken();
  
      if (token) {
        // append the access token to the request header
        return request.clone({
          setHeaders: {
            'token': token
          }
        })
      }
      return request;
    }
  
  }  
