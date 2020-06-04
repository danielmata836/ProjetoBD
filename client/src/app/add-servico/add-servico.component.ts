import { Component, Injector } from '@angular/core';
import { AddServicoGenerated } from './add-servico-generated.component';

@Component({
  selector: 'page-add-servico',
  templateUrl: './add-servico.component.html'
})
export class AddServicoComponent extends AddServicoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
