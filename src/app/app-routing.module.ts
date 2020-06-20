import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { UsuarioComponent } from './pages/usuario/usuario.component';
import { QuestaoComponent } from './pages/questao/questao.component';
import { ProvaComponent } from './pages/prova/prova.component';
import { ResultadoComponent } from './pages/resultado/resultado.component';

const routes: Routes = [
   { path: 'home', component: HomeComponent },
   { path: 'usuario', component: UsuarioComponent },
   { path: 'questao', component: QuestaoComponent },
   { path: 'prova', component: ProvaComponent },
   { path: 'resultado', component: ResultadoComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
