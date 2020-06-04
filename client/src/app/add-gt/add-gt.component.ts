import { Component, Injector } from '@angular/core';
import { AddGtGenerated } from './add-gt-generated.component';

@Component({
  selector: 'page-add-gt',
  templateUrl: './add-gt.component.html'
})
export class AddGtComponent extends AddGtGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
