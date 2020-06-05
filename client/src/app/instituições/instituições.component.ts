import { Component, Injector } from '@angular/core';
import { InstituicoesGenerated } from './instituições-generated.component';

@Component({
  selector: 'page-instituições',
  templateUrl: './instituições.component.html'
})
export class InstituicoesComponent extends InstituicoesGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
