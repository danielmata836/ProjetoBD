import { Component, Injector } from '@angular/core';
import { InstituicaosGenerated } from './instituicaos-generated.component';

@Component({
  selector: 'page-instituicaos',
  templateUrl: './instituicaos.component.html'
})
export class InstituicaosComponent extends InstituicaosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
