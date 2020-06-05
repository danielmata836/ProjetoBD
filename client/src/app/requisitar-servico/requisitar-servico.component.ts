import { Component, Injector } from '@angular/core';
import { RequisitarServicoGenerated } from './requisitar-servico-generated.component';

@Component({
  selector: 'page-requisitar-servico',
  templateUrl: './requisitar-servico.component.html'
})
export class RequisitarServicoComponent extends RequisitarServicoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
