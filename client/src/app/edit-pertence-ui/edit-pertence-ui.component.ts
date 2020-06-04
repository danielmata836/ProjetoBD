import { Component, Injector } from '@angular/core';
import { EditPertenceUiGenerated } from './edit-pertence-ui-generated.component';

@Component({
  selector: 'page-edit-pertence-ui',
  templateUrl: './edit-pertence-ui.component.html'
})
export class EditPertenceUiComponent extends EditPertenceUiGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
