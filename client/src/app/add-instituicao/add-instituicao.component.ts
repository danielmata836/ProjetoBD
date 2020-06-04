import { Component, Injector } from '@angular/core';
import { AddInstituicaoGenerated } from './add-instituicao-generated.component';

@Component({
  selector: 'page-add-instituicao',
  templateUrl: './add-instituicao.component.html'
})
export class AddInstituicaoComponent extends AddInstituicaoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
