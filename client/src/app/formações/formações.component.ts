import { Component, Injector } from '@angular/core';
import { FormacoesGenerated } from './formações-generated.component';

@Component({
  selector: 'page-formações',
  templateUrl: './formações.component.html'
})
export class FormacoesComponent extends FormacoesGenerated {
  constructor(injector: Injector) {
    super(injector);
  }
}
