import { Component, Injector } from '@angular/core';
import { EditPedeGenerated } from './edit-pede-generated.component';

@Component({
  selector: 'page-edit-pede',
  templateUrl: './edit-pede.component.html'
})
export class EditPedeComponent extends EditPedeGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
