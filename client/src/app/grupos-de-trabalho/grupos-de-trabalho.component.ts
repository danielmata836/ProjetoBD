import { Component, Injector } from '@angular/core';
import { GruposDeTrabalhoGenerated } from './grupos-de-trabalho-generated.component';

@Component({
  selector: 'page-grupos-de-trabalho',
  templateUrl: './grupos-de-trabalho.component.html'
})
export class GruposDeTrabalhoComponent extends GruposDeTrabalhoGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
