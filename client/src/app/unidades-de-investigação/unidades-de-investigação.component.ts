import { Component, Injector } from '@angular/core';
import { UnidadesDeInvestigacaoGenerated } from './unidades-de-investigação-generated.component';

@Component({
  selector: 'page-unidades-de-investigação',
  templateUrl: './unidades-de-investigação.component.html'
})
export class UnidadesDeInvestigacaoComponent extends UnidadesDeInvestigacaoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
