import { Component, Injector } from '@angular/core';
import { ProdutosGenerated } from './produtos-generated.component';

@Component({
  selector: 'page-produtos',
  templateUrl: './produtos.component.html'
})
export class ProdutosComponent extends ProdutosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
