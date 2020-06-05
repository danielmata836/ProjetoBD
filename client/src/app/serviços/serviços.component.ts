import { Component, Injector } from '@angular/core';
import { ServicosGenerated } from './serviços-generated.component';

@Component({
  selector: 'page-serviços',
  templateUrl: './serviços.component.html'
})
export class ServicosComponent extends ServicosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
