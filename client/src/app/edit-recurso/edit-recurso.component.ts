import { Component, Injector } from '@angular/core';
import { EditRecursoGenerated } from './edit-recurso-generated.component';

@Component({
  selector: 'page-edit-recurso',
  templateUrl: './edit-recurso.component.html'
})
export class EditRecursoComponent extends EditRecursoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
