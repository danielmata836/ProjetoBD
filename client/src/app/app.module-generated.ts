/*
  This file is automatically generated. Any changes will be overwritten.
  Modify app.module.ts instead.
*/
import { APP_INITIALIZER } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { BodyModule } from '@radzen/angular/dist/body';
import { CardModule } from '@radzen/angular/dist/card';
import { ContentContainerModule } from '@radzen/angular/dist/content-container';
import { HeaderModule } from '@radzen/angular/dist/header';
import { SidebarToggleModule } from '@radzen/angular/dist/sidebar-toggle';
import { LabelModule } from '@radzen/angular/dist/label';
import { ProfileMenuModule } from '@radzen/angular/dist/profilemenu';
import { GravatarModule } from '@radzen/angular/dist/gravatar';
import { SidebarModule } from '@radzen/angular/dist/sidebar';
import { PanelMenuModule } from '@radzen/angular/dist/panelmenu';
import { FooterModule } from '@radzen/angular/dist/footer';
import { ContentModule } from '@radzen/angular/dist/content';
import { HeadingModule } from '@radzen/angular/dist/heading';
import { GridModule } from '@radzen/angular/dist/grid';
import { FormModule } from '@radzen/angular/dist/form';
import { SchedulerModule } from '@radzen/angular/dist/scheduler';
import { LoginModule } from '@radzen/angular/dist/login';
import { HtmlModule } from '@radzen/angular/dist/html';
import { SharedModule } from '@radzen/angular/dist/shared';
import { NotificationModule } from '@radzen/angular/dist/notification';
import { DialogModule } from '@radzen/angular/dist/dialog';

import { ConfigService, configServiceFactory } from './config.service';
import { AppRoutes } from './app.routes';
import { AppComponent } from './app.component';
import { CacheInterceptor } from './cache.interceptor';
export { AppComponent } from './app.component';
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
import { FormacaosComponent } from './formacaos/formacaos.component';
import { AddFormacaoComponent } from './add-formacao/add-formacao.component';
import { EditFormacaoComponent } from './edit-formacao/edit-formacao.component';
import { AddProdutoComponent } from './add-produto/add-produto.component';
import { EditProdutoComponent } from './edit-produto/edit-produto.component';
import { LoginLayoutComponent } from './login-layout/login-layout.component';
import { MainLayoutComponent } from './main-layout/main-layout.component';

import { ProjetoNewService } from './projeto-new.service';
import { SecurityService, UserService } from './security.service';
import { SecurityInterceptor } from './security.interceptor';
import { AuthGuard } from './auth.guard';

export const PageDeclarations = [
  EquipamentosComponent,
  AddEquipamentoComponent,
  EditEquipamentoComponent,
  EstaAtribuidosComponent,
  AddEstaAtribuidoComponent,
  EditEstaAtribuidoComponent,
  FormacoesComponent,
  GruposDeTrabalhoComponent,
  AddGtComponent,
  EditGtComponent,
  InstituicoesComponent,
  AddInstituicaoComponent,
  EditInstituicaoComponent,
  PedesComponent,
  AddPedeComponent,
  EditPedeComponent,
  PertenceUisComponent,
  AddPertenceUiComponent,
  EditPertenceUiComponent,
  PertencersComponent,
  AddPertencerComponent,
  EditPertencerComponent,
  PessoasComponent,
  AddPessoaComponent,
  EditPessoaComponent,
  ProdutosComponent,
  RecursosComponent,
  AddRecursoComponent,
  EditRecursoComponent,
  ServicosComponent,
  AddServicoComponent,
  EditServicoComponent,
  UnidadesDeInvestigacaoComponent,
  AddUiComponent,
  EditUiComponent,
  CalendarioComponent,
  ApplicationUsersComponent,
  ApplicationRolesComponent,
  RegisterApplicationUserComponent,
  AddApplicationRoleComponent,
  AddApplicationUserComponent,
  EditApplicationUserComponent,
  ProfileComponent,
  LoginComponent,
  UnauthorizedComponent,
  FormacaosComponent,
  AddFormacaoComponent,
  EditFormacaoComponent,
  AddProdutoComponent,
  EditProdutoComponent,
];

export const LayoutDeclarations = [
  LoginLayoutComponent,
  MainLayoutComponent,
];

export const AppDeclarations = [
  ...PageDeclarations,
  ...LayoutDeclarations,
  AppComponent
];

export const AppProviders = [
  {
    provide: HTTP_INTERCEPTORS,
    useClass: CacheInterceptor,
    multi: true
  },
  ProjetoNewService,
  UserService,
  SecurityService,
  {
    provide: HTTP_INTERCEPTORS,
    useClass: SecurityInterceptor,
    multi: true
  },
  AuthGuard,
  ConfigService,
  {
    provide: APP_INITIALIZER,
    useFactory: configServiceFactory,
    deps: [ConfigService],
    multi: true
  }
];

export const AppImports = [
  BrowserModule,
  BrowserAnimationsModule,
  FormsModule,
  HttpClientModule,
  BodyModule,
  CardModule,
  ContentContainerModule,
  HeaderModule,
  SidebarToggleModule,
  LabelModule,
  ProfileMenuModule,
  GravatarModule,
  SidebarModule,
  PanelMenuModule,
  FooterModule,
  ContentModule,
  HeadingModule,
  GridModule,
  FormModule,
  SchedulerModule,
  LoginModule,
  HtmlModule,
  SharedModule,
  NotificationModule,
  DialogModule,
  AppRoutes
];
