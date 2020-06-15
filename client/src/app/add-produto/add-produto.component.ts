import { Component, Injector } from '@angular/core';
import { AddProdutoGenerated } from './add-produto-generated.component';

@Component({
  selector: 'page-add-produto',
  templateUrl: './add-produto.component.html'
})
export class AddProdutoComponent extends AddProdutoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
