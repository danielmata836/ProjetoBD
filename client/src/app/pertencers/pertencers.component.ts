import { Component, Injector } from '@angular/core';
import { PertencersGenerated } from './pertencers-generated.component';

@Component({
  selector: 'page-pertencers',
  templateUrl: './pertencers.component.html'
})
export class PertencersComponent extends PertencersGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
