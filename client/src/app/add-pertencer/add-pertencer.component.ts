import { Component, Injector } from '@angular/core';
import { AddPertencerGenerated } from './add-pertencer-generated.component';

@Component({
  selector: 'page-add-pertencer',
  templateUrl: './add-pertencer.component.html'
})
export class AddPertencerComponent extends AddPertencerGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
