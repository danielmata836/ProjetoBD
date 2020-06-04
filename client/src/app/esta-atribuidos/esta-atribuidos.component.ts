import { Component, Injector } from '@angular/core';
import { EstaAtribuidosGenerated } from './esta-atribuidos-generated.component';

@Component({
  selector: 'page-esta-atribuidos',
  templateUrl: './esta-atribuidos.component.html'
})
export class EstaAtribuidosComponent extends EstaAtribuidosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
