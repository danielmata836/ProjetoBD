import { Component, Injector } from '@angular/core';
import { EditGtGenerated } from './edit-gt-generated.component';

@Component({
  selector: 'page-edit-gt',
  templateUrl: './edit-gt.component.html'
})
export class EditGtComponent extends EditGtGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
