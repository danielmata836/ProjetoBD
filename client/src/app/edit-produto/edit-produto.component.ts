import { Component, Injector } from '@angular/core';
import { EditProdutoGenerated } from './edit-produto-generated.component';

@Component({
  selector: 'page-edit-produto',
  templateUrl: './edit-produto.component.html'
})
export class EditProdutoComponent extends EditProdutoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
