import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { NewListComponent } from './component/new-list/new-list.component';
import { NewTaskComponent } from './component/new-task/new-task.component';
import { LoginComponent } from './pages/login/login.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'new-list', component: NewListComponent },
  { path: 'login', component: LoginComponent },

  { path: 'home', component: HomeComponent },
  { path: 'liste/:listeId', component: HomeComponent },
  { path: 'liste/:listeId/new-task', component: NewTaskComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
