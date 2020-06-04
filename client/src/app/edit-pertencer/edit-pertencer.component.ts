import { Component, Injector } from '@angular/core';
import { EditPertencerGenerated } from './edit-pertencer-generated.component';

@Component({
  selector: 'page-edit-pertencer',
  templateUrl: './edit-pertencer.component.html'
})
export class EditPertencerComponent extends EditPertencerGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
