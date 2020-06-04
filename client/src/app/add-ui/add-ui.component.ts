import { Component, Injector } from '@angular/core';
import { AddUiGenerated } from './add-ui-generated.component';

@Component({
  selector: 'page-add-ui',
  templateUrl: './add-ui.component.html'
})
export class AddUiComponent extends AddUiGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
