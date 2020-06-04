import { Component, Injector } from '@angular/core';
import { ServicoCalendarGenerated } from './servico-calendar-generated.component';

@Component({
  selector: 'page-servico-calendar',
  templateUrl: './servico-calendar.component.html'
})
export class ServicoCalendarComponent extends ServicoCalendarGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
