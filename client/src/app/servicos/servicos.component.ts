import { Component, Injector } from '@angular/core';
import { ServicosGenerated } from './servicos-generated.component';

@Component({
  selector: 'page-servicos',
  templateUrl: './servicos.component.html'
})
export class ServicosComponent extends ServicosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
