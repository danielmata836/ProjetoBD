import { Component, Injector } from '@angular/core';
import { EditFormacaoGenerated } from './edit-formacao-generated.component';

@Component({
  selector: 'page-edit-formacao',
  templateUrl: './edit-formacao.component.html'
})
export class EditFormacaoComponent extends EditFormacaoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
