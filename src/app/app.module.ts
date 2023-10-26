import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './pages/home/home.component';
import {  HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { NewListComponent } from './component/new-list/new-list.component';
import { NewTaskComponent } from './component/new-task/new-task.component';
import { LoginComponent } from './pages/login/login.component';
import { ReactiveFormsModule } from '@angular/forms';
import { FormsModule } from '@angular/forms'; 
import { WebReqInterceptor } from './interceptor/web-req.interceptor';
import { RegisterComponent } from './pages/register/register.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { EditListComponent } from './component/edit-list/edit-list.component';
import { EditTacheComponent } from './component/edit-tache/edit-tache.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    NewListComponent,
    NewTaskComponent,
    LoginComponent,
    RegisterComponent,
    EditListComponent,
    EditTacheComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
    NgbModule
  ],
  providers: [
    { provide: HTTP_INTERCEPTORS, 
      useClass: WebReqInterceptor, 
      multi: true }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
