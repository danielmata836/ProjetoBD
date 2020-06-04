import { Component, Injector } from '@angular/core';
import { UisGenerated } from './uis-generated.component';

@Component({
  selector: 'page-uis',
  templateUrl: './uis.component.html'
})
export class UisComponent extends UisGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
