import { Component, Injector } from '@angular/core';
import { EditEquipamentoGenerated } from './edit-equipamento-generated.component';

@Component({
  selector: 'page-edit-equipamento',
  templateUrl: './edit-equipamento.component.html'
})
export class EditEquipamentoComponent extends EditEquipamentoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
