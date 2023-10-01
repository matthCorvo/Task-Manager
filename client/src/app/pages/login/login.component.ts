import { HttpResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators  } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  constructor( private authService: AuthService, private router: Router) { }
  username: string = ''; 
  password: string = '';
  
  ngOnInit() {
  }


  onLoginButtonClick() {
    console.log('Login button clicked');
    this.authService.login(this.username, this.password).subscribe((res: HttpResponse<any>) => {
      console.log('Login response:', res);
  
      if (res && res.body.token) {
        // Save the access token in your AuthService
        this.authService.setAccessToken(res.body.token);
        // Redirect to the home page or any desired route
        this.router.navigate(['/home']);
      } else {
        // Handle the case when the response does not contain an access token
        console.error('Invalid response from the server');
      }
    },
    (error) => {
      // Handle errors here, e.g., display an error message to the user
      console.error('Login failed', error);
    });
  }
  
}