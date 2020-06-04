import { Component, Injector } from '@angular/core';
import { AddPedeGenerated } from './add-pede-generated.component';

@Component({
  selector: 'page-add-pede',
  templateUrl: './add-pede.component.html'
})
export class AddPedeComponent extends AddPedeGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
