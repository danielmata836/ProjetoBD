import { Component, Injector } from '@angular/core';
import { PedesGenerated } from './pedes-generated.component';

@Component({
  selector: 'page-pedes',
  templateUrl: './pedes.component.html'
})
export class PedesComponent extends PedesGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
