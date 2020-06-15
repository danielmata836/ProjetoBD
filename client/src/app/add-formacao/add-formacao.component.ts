import { Component, Injector } from '@angular/core';
import { AddFormacaoGenerated } from './add-formacao-generated.component';

@Component({
  selector: 'page-add-formacao',
  templateUrl: './add-formacao.component.html'
})
export class AddFormacaoComponent extends AddFormacaoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
