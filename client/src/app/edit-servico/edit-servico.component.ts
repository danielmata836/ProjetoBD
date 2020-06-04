import { Component, Injector } from '@angular/core';
import { EditServicoGenerated } from './edit-servico-generated.component';

@Component({
  selector: 'page-edit-servico',
  templateUrl: './edit-servico.component.html'
})
export class EditServicoComponent extends EditServicoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
