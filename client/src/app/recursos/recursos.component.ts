import { Component, Injector } from '@angular/core';
import { RecursosGenerated } from './recursos-generated.component';

@Component({
  selector: 'page-recursos',
  templateUrl: './recursos.component.html'
})
export class RecursosComponent extends RecursosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
