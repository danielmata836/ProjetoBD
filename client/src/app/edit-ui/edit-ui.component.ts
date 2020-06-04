import { Component, Injector } from '@angular/core';
import { EditUiGenerated } from './edit-ui-generated.component';

@Component({
  selector: 'page-edit-ui',
  templateUrl: './edit-ui.component.html'
})
export class EditUiComponent extends EditUiGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
