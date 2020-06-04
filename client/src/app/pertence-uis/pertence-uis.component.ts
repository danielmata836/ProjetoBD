import { Component, Injector } from '@angular/core';
import { PertenceUisGenerated } from './pertence-uis-generated.component';

@Component({
  selector: 'page-pertence-uis',
  templateUrl: './pertence-uis.component.html'
})
export class PertenceUisComponent extends PertenceUisGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
