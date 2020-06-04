import { Component, Injector } from '@angular/core';
import { EditEstaAtribuidoGenerated } from './edit-esta-atribuido-generated.component';

@Component({
  selector: 'page-edit-esta-atribuido',
  templateUrl: './edit-esta-atribuido.component.html'
})
export class EditEstaAtribuidoComponent extends EditEstaAtribuidoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
