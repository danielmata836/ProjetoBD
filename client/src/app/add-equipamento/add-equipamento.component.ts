import { Component, Injector } from '@angular/core';
import { AddEquipamentoGenerated } from './add-equipamento-generated.component';

@Component({
  selector: 'page-add-equipamento',
  templateUrl: './add-equipamento.component.html'
})
export class AddEquipamentoComponent extends AddEquipamentoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
