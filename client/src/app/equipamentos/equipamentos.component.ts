import { Component, Injector } from '@angular/core';
import { EquipamentosGenerated } from './equipamentos-generated.component';

@Component({
  selector: 'page-equipamentos',
  templateUrl: './equipamentos.component.html'
})
export class EquipamentosComponent extends EquipamentosGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
