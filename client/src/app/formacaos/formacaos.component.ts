import { Component, Injector } from '@angular/core';
import { FormacaosGenerated } from './formacaos-generated.component';

@Component({
  selector: 'page-formacaos',
  templateUrl: './formacaos.component.html'
})
export class FormacaosComponent extends FormacaosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
