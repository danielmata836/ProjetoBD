import { Component, Injector } from '@angular/core';
import { EditInstituicaoGenerated } from './edit-instituicao-generated.component';

@Component({
  selector: 'page-edit-instituicao',
  templateUrl: './edit-instituicao.component.html'
})
export class EditInstituicaoComponent extends EditInstituicaoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
