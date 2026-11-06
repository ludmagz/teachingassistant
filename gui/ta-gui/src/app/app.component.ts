import { Component } from '@angular/core';
import { NgModule } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: false,
  styleUrl: './app.component.css',
  templateUrl: './app.component.html',
})
export class AppComponent {
   aluno: Aluno = {nome: "", cpf: "", email: "", githubLogin: ""};
}

export class Aluno {
  nome: string;
  cpf: string;
  email: string;
  githubLogin: string;
}
