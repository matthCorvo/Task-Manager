import { HttpResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';

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

  // Gestionnaire de clic pour le bouton de connexion
  onLoginButtonClick() {
    console.log('Login clicked');

    // Appele le service d'authentification pour effectuer la connexion
    this.authService.login(this.username, this.password).subscribe((res: HttpResponse<any>) => {
      console.log('Login response:', res);

      // Vérifie si la réponse contient un jeton d'accès valide
      if (res && res.body.token) {
        // Sauvegarde le jeton d'accès dans votre service AuthService
        this.authService.setAccessToken(res.body.token);
        this.router.navigate(['/home']);
      } else {
        console.error('Réponse invalide du serveur');
      }
    },
    (error) => {
      console.error('Login failed', error);
    });
  }
  
}