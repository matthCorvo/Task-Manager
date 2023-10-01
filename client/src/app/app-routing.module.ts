import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { NewListComponent } from './component/new-list/new-list.component';
import { NewTaskComponent } from './component/new-task/new-task.component';
import { LoginComponent } from './pages/login/login.component';
import { RegisterComponent } from './pages/register/register.component';
import { EditListComponent } from './component/edit-list/edit-list.component';
import { EditTacheComponent } from './component/edit-tache/edit-tache.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'new-list', component: NewListComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'edit-list/:listeId', component: EditListComponent },
  { path: 'liste/:listeId/edit-task/:tacheId', component: EditTacheComponent },
  { path: 'home', component: HomeComponent },
  { path: 'liste/:listeId', component: HomeComponent },
  { path: 'liste/:listeId/new-task', component: NewTaskComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
