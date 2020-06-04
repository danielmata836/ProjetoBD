import { Component, Injector } from '@angular/core';
import { AddPertenceUiGenerated } from './add-pertence-ui-generated.component';

@Component({
  selector: 'page-add-pertence-ui',
  templateUrl: './add-pertence-ui.component.html'
})
export class AddPertenceUiComponent extends AddPertenceUiGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
