import { Component, Injector } from '@angular/core';
import { GtsGenerated } from './gts-generated.component';

@Component({
  selector: 'page-gts',
  templateUrl: './gts.component.html'
})
export class GtsComponent extends GtsGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
