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



  onLoginButtonClick():void {
      this.authService.login(this.username, this.password).subscribe((response) => {
        if (response.status === 200) {
          // we have logged in successfully
          this.router.navigate(['/liste']);
        }
        console.log(response);
        localStorage.setItem('token', response.token);
      },
      (error) => {
        // Handle login error here
        console.error(error);
        } 
        );
      } 

}