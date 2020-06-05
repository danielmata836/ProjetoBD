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
import { FormacoesComponent } from './formações/formações.component';
import { GruposDeTrabalhoComponent } from './grupos-de-trabalho/grupos-de-trabalho.component';
import { AddGtComponent } from './add-gt/add-gt.component';
import { EditGtComponent } from './edit-gt/edit-gt.component';
import { InstituicoesComponent } from './instituições/instituições.component';
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
import { ServicosComponent } from './serviços/serviços.component';
import { AddServicoComponent } from './add-servico/add-servico.component';
import { EditServicoComponent } from './edit-servico/edit-servico.component';
import { UnidadesDeInvestigacaoComponent } from './unidades-de-investigação/unidades-de-investigação.component';
import { AddUiComponent } from './add-ui/add-ui.component';
import { EditUiComponent } from './edit-ui/edit-ui.component';
import { CalendarioComponent } from './calendário/calendário.component';
import { ApplicationUsersComponent } from './application-users/application-users.component';
import { ApplicationRolesComponent } from './application-roles/application-roles.component';
import { RegisterApplicationUserComponent } from './register-application-user/register-application-user.component';
import { AddApplicationRoleComponent } from './add-application-role/add-application-role.component';
import { AddApplicationUserComponent } from './add-application-user/add-application-user.component';
import { EditApplicationUserComponent } from './edit-application-user/edit-application-user.component';
import { ProfileComponent } from './profile/profile.component';
import { LoginComponent } from './login/login.component';
import { UnauthorizedComponent } from './unauthorized/unauthorized.component';

import { SecurityService } from './security.service';
import { AuthGuard } from './auth.guard';
export const routes: Routes = [
  { path: '', redirectTo: '/calendário', pathMatch: 'full' },
  {
    path: '',
    component: MainLayoutComponent,
    children: [
      {
        path: 'equipamentos',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: EquipamentosComponent
      },
      {
        path: 'add-equipamento',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff', 'Member'],
        },
        component: AddEquipamentoComponent
      },
      {
        path: 'edit-equipamento/:no_regis_produto',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditEquipamentoComponent
      },
      {
        path: 'esta-atribuidos',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EstaAtribuidosComponent
      },
      {
        path: 'add-esta-atribuido',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: AddEstaAtribuidoComponent
      },
      {
        path: 'edit-esta-atribuido/:index_Recurso/:index_servicos',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditEstaAtribuidoComponent
      },
      {
        path: 'formações',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: FormacoesComponent
      },
      {
        path: 'grupos-de-trabalho',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: GruposDeTrabalhoComponent
      },
      {
        path: 'add-gt',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: AddGtComponent
      },
      {
        path: 'edit-gt/:id_GT',
        canActivate: [AuthGuard],
        data: {
          roles: ['Admin'],
        },
        component: EditGtComponent
      },
      {
        path: 'instituições',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: InstituicoesComponent
      },
      {
        path: 'add-instituicao',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: AddInstituicaoComponent
      },
      {
        path: 'edit-instituicao/:Num_Inst',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditInstituicaoComponent
      },
      {
        path: 'pedes',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: PedesComponent
      },
      {
        path: 'add-pede',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: AddPedeComponent
      },
      {
        path: 'edit-pede/:id_Pessoa/:index_servicos',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditPedeComponent
      },
      {
        path: 'pertence-uis',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: PertenceUisComponent
      },
      {
        path: 'add-pertence-ui',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: AddPertenceUiComponent
      },
      {
        path: 'edit-pertence-ui/:id_UI/:id_Pessoa',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditPertenceUiComponent
      },
      {
        path: 'pertencers',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: PertencersComponent
      },
      {
        path: 'add-pertencer',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: AddPertencerComponent
      },
      {
        path: 'edit-pertencer/:Num_Inst/:no_regis_produto',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditPertencerComponent
      },
      {
        path: 'pessoas',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: PessoasComponent
      },
      {
        path: 'add-pessoa',
        canActivate: [AuthGuard],
        data: {
          roles: ['Admin'],
        },
        component: AddPessoaComponent
      },
      {
        path: 'edit-pessoa/:id_Pessoa',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditPessoaComponent
      },
      {
        path: 'produtos',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: ProdutosComponent
      },
      {
        path: 'recursos',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: RecursosComponent
      },
      {
        path: 'add-recurso',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff', 'Member'],
        },
        component: AddRecursoComponent
      },
      {
        path: 'edit-recurso/:index_Recurso',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditRecursoComponent
      },
      {
        path: 'serviços',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: ServicosComponent
      },
      {
        path: 'add-servico/:start/:end',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: AddServicoComponent
      },
      {
        path: 'edit-servico/:index_servicos',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditServicoComponent
      },
      {
        path: 'unidades-de-investigação',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: UnidadesDeInvestigacaoComponent
      },
      {
        path: 'add-ui',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: AddUiComponent
      },
      {
        path: 'edit-ui/:id_UI',
        canActivate: [AuthGuard],
        data: {
          roles: ['Staff'],
        },
        component: EditUiComponent
      },
      {
        path: 'calendário',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: CalendarioComponent
      },
      {
        path: 'application-users',
        canActivate: [AuthGuard],
        data: {
          roles: ['Admin'],
        },
        component: ApplicationUsersComponent
      },
      {
        path: 'application-roles',
        canActivate: [AuthGuard],
        data: {
          roles: ['Admin'],
        },
        component: ApplicationRolesComponent
      },
      {
        path: 'register-application-user',
        data: {
          roles: ['Everybody'],
        },
        component: RegisterApplicationUserComponent
      },
      {
        path: 'add-application-role',
        canActivate: [AuthGuard],
        data: {
          roles: ['Admin'],
        },
        component: AddApplicationRoleComponent
      },
      {
        path: 'add-application-user',
        canActivate: [AuthGuard],
        data: {
          roles: ['Admin'],
        },
        component: AddApplicationUserComponent
      },
      {
        path: 'edit-application-user/:Id',
        canActivate: [AuthGuard],
        data: {
          roles: ['Admin'],
        },
        component: EditApplicationUserComponent
      },
      {
        path: 'profile',
        canActivate: [AuthGuard],
        data: {
          roles: ['Authenticated'],
        },
        component: ProfileComponent
      },
      {
        path: 'unauthorized',
        data: {
          roles: ['Everybody'],
        },
        component: UnauthorizedComponent
      },
    ]
  },
  {
    path: '',
    component: LoginLayoutComponent,
    children: [
      {
        path: 'login',
        data: {
          roles: ['Everybody'],
        },
        component: LoginComponent
      },
    ]
  },
];

export const AppRoutes: ModuleWithProviders = RouterModule.forRoot(routes);
