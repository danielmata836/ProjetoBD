import { Component, Injector } from '@angular/core';
import { AddRecursoGenerated } from './add-recurso-generated.component';

@Component({
  selector: 'page-add-recurso',
  templateUrl: './add-recurso.component.html'
})
export class AddRecursoComponent extends AddRecursoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
