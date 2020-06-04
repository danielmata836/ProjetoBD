import { Component, Injector } from '@angular/core';
import { AddEstaAtribuidoGenerated } from './add-esta-atribuido-generated.component';

@Component({
  selector: 'page-add-esta-atribuido',
  templateUrl: './add-esta-atribuido.component.html'
})
export class AddEstaAtribuidoComponent extends AddEstaAtribuidoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
