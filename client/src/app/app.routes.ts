import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule, ActivatedRoute } from '@angular/router';

import { LoginLayoutComponent } from './login-layout/login-layout.component';
import { MainLayoutComponent } from './main-layout/main-layout.component';
import { EquipamentosComponent } from './equipamentos/equipamentos.component';
import { AddEquipamentoComponent } from './add-equipamento/add-equipamento.component';
import { EditEquipamentoComponent } from './edit-equipamento/edit-equipamento.component';
import { EstaAtribuidosComponent } from './esta-atribuidos/esta-atribuidos.component';
import { AddEstaAtribuidoComponent } from './add-esta-atribuido/add-esta-atribuido.component';
import { EditEstaAtribuidoComponent } from './edit-esta-atribuido/edit-esta-atribuido.component';
import { FormacaosComponent } from './formacaos/formacaos.component';
import { GtsComponent } from './gts/gts.component';
import { AddGtComponent } from './add-gt/add-gt.component';
import { EditGtComponent } from './edit-gt/edit-gt.component';
import { InstituicaosComponent } from './instituicaos/instituicaos.component';
import { AddInstituicaoComponent } from './add-instituicao/add-instituicao.component';
import { EditInstituicaoComponent } from './edit-instituicao/edit-instituicao.component';
import { PedesComponent } from './pedes/pedes.component';
import { AddPedeComponent } from './add-pede/add-pede.component';
import { EditPedeComponent } from './edit-pede/edit-pede.component';
import { PertenceUisComponent } from './pertence-uis/pertence-uis.component';
import { AddPertenceUiComponent } from './add-pertence-ui/add-pertence-ui.component';
import { EditPertenceUiComponent } from './edit-pertence-ui/edit-pertence-ui.component';
import { PertencersComponent } from './pertencers/pertencers.component';
import { AddPertencerComponent } from './add-pertencer/add-pertencer.component';
import { EditPertencerComponent } from './edit-pertencer/edit-pertencer.component';
import { PessoasComponent } from './pessoas/pessoas.component';
import { AddPessoaComponent } from './add-pessoa/add-pessoa.component';
import { EditPessoaComponent } from './edit-pessoa/edit-pessoa.component';
import { ProdutosComponent } from './produtos/produtos.component';
import { RecursosComponent } from './recursos/recursos.component';
import { AddRecursoComponent } from './add-recurso/add-recurso.component';
import { EditRecursoComponent } from './edit-recurso/edit-recurso.component';
import { ServicosComponent } from './servicos/servicos.component';
import { AddServicoComponent } from './add-servico/add-servico.component';
import { EditServicoComponent } from './edit-servico/edit-servico.component';
import { UisComponent } from './uis/uis.component';
import { AddUiComponent } from './add-ui/add-ui.component';
import { EditUiComponent } from './edit-ui/edit-ui.component';
import { ServicoCalendarComponent } from './servico-calendar/servico-calendar.component';

export const routes: Routes = [
  { path: '', redirectTo: '/equipamentos', pathMatch: 'full' },
  {
    path: '',
    component: MainLayoutComponent,
    children: [
      {
        path: 'equipamentos',
        component: EquipamentosComponent
      },
      {
        path: 'add-equipamento',
        component: AddEquipamentoComponent
      },
      {
        path: 'edit-equipamento/:no_regis_produto',
        component: EditEquipamentoComponent
      },
      {
        path: 'esta-atribuidos',
        component: EstaAtribuidosComponent
      },
      {
        path: 'add-esta-atribuido',
        component: AddEstaAtribuidoComponent
      },
      {
        path: 'edit-esta-atribuido/:index_Recurso/:index_servicos',
        component: EditEstaAtribuidoComponent
      },
      {
        path: 'formacaos',
        component: FormacaosComponent
      },
      {
        path: 'gts',
        component: GtsComponent
      },
      {
        path: 'add-gt',
        component: AddGtComponent
      },
      {
        path: 'edit-gt/:id_GT',
        component: EditGtComponent
      },
      {
        path: 'instituicaos',
        component: InstituicaosComponent
      },
      {
        path: 'add-instituicao',
        component: AddInstituicaoComponent
      },
      {
        path: 'edit-instituicao/:Num_Inst',
        component: EditInstituicaoComponent
      },
      {
        path: 'pedes',
        component: PedesComponent
      },
      {
        path: 'add-pede',
        component: AddPedeComponent
      },
      {
        path: 'edit-pede/:id_Pessoa/:index_servicos',
        component: EditPedeComponent
      },
      {
        path: 'pertence-uis',
        component: PertenceUisComponent
      },
      {
        path: 'add-pertence-ui',
        component: AddPertenceUiComponent
      },
      {
        path: 'edit-pertence-ui/:id_UI/:id_Pessoa',
        component: EditPertenceUiComponent
      },
      {
        path: 'pertencers',
        component: PertencersComponent
      },
      {
        path: 'add-pertencer',
        component: AddPertencerComponent
      },
      {
        path: 'edit-pertencer/:Num_Inst/:no_regis_produto',
        component: EditPertencerComponent
      },
      {
        path: 'pessoas',
        component: PessoasComponent
      },
      {
        path: 'add-pessoa',
        component: AddPessoaComponent
      },
      {
        path: 'edit-pessoa/:id_Pessoa',
        component: EditPessoaComponent
      },
      {
        path: 'produtos',
        component: ProdutosComponent
      },
      {
        path: 'recursos',
        component: RecursosComponent
      },
      {
        path: 'add-recurso',
        component: AddRecursoComponent
      },
      {
        path: 'edit-recurso/:index_Recurso',
        component: EditRecursoComponent
      },
      {
        path: 'servicos',
        component: ServicosComponent
      },
      {
        path: 'add-servico/:start/:end',
        component: AddServicoComponent
      },
      {
        path: 'edit-servico/:index_servicos',
        component: EditServicoComponent
      },
      {
        path: 'uis',
        component: UisComponent
      },
      {
        path: 'add-ui',
        component: AddUiComponent
      },
      {
        path: 'edit-ui/:id_UI',
        component: EditUiComponent
      },
      {
        path: 'servico-calendar',
        component: ServicoCalendarComponent
      },
    ]
  },
];

export const AppRoutes: ModuleWithProviders = RouterModule.forRoot(routes);
