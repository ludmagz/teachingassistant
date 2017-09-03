<<<<<<< HEAD
import { NgModule, provideBrowserGlobalErrorListeners } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing-module';
=======
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

>>>>>>> 8303e24 (elementos do formulario para cadastro de alunos)
import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
<<<<<<< HEAD
    AppRoutingModule,
    FormsModule
  ],
  providers: [
    provideBrowserGlobalErrorListeners(),
    //provideClientHydration(),
=======
    FormsModule
>>>>>>> 8303e24 (elementos do formulario para cadastro de alunos)
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
