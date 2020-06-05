import { Component, Injector } from '@angular/core';
import { CalendarioGenerated } from './calendário-generated.component';

@Component({
  selector: 'page-calendário',
  templateUrl: './calendário.component.html'
})
export class CalendarioComponent extends CalendarioGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
