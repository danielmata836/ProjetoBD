/*
  This file is automatically generated. Any changes will be overwritten.
  Modify servico-calendar.component.ts instead.
*/
import { LOCALE_ID, ChangeDetectorRef, ViewChild, AfterViewInit, Injector, OnInit, OnDestroy } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';
import { Subscription } from 'rxjs';

import { DialogService, DIALOG_PARAMETERS, DialogRef } from '@radzen/angular/dist/dialog';
import { NotificationService } from '@radzen/angular/dist/notification';
import { ContentComponent } from '@radzen/angular/dist/content';
import { HeadingComponent } from '@radzen/angular/dist/heading';
import { SchedulerComponent } from '@radzen/angular/dist/scheduler';

import { ConfigService } from '../config.service';
import { EditServicoComponent } from '../edit-servico/edit-servico.component';
import { AddServicoComponent } from '../add-servico/add-servico.component';

import { ProjetoNewService } from '../projeto-new.service';

export class ServicoCalendarGenerated implements AfterViewInit, OnInit, OnDestroy {
  // Components
  @ViewChild('content1') content1: ContentComponent;
  @ViewChild('pageTitle') pageTitle: HeadingComponent;
  @ViewChild('scheduler0') scheduler0: SchedulerComponent;

  router: Router;

  cd: ChangeDetectorRef;

  route: ActivatedRoute;

  notificationService: NotificationService;

  configService: ConfigService;

  dialogService: DialogService;

  dialogRef: DialogRef;

  httpClient: HttpClient;

  locale: string;

  _location: Location;

  _subscription: Subscription;

  projetoNew: ProjetoNewService;
  getServicosResult: any;
  parameters: any;

  constructor(private injector: Injector) {
  }

  ngOnInit() {
    this.notificationService = this.injector.get(NotificationService);

    this.configService = this.injector.get(ConfigService);

    this.dialogService = this.injector.get(DialogService);

    this.dialogRef = this.injector.get(DialogRef, null);

    this.locale = this.injector.get(LOCALE_ID);

    this.router = this.injector.get(Router);

    this.cd = this.injector.get(ChangeDetectorRef);

    this._location = this.injector.get(Location);

    this.route = this.injector.get(ActivatedRoute);

    this.httpClient = this.injector.get(HttpClient);

    this.projetoNew = this.injector.get(ProjetoNewService);
  }

  ngAfterViewInit() {
    this._subscription = this.route.params.subscribe(parameters => {
      if (this.dialogRef) {
        this.parameters = this.injector.get(DIALOG_PARAMETERS);
      } else {
        this.parameters = parameters;
      }
      this.load();
      this.cd.detectChanges();
    });
  }

  ngOnDestroy() {
    this._subscription.unsubscribe();
  }


  load() {
    this.projetoNew.getServicos(null, null, null, null, null, null, null, null)
    .subscribe((result: any) => {
      this.getServicosResult = result.value;
    }, (result: any) => {

    });
  }

  scheduler0EventSelect(event: any) {
    this.dialogService.open(EditServicoComponent, { parameters: {index_servicos: event.index_servicos}, title: 'Edit Servico' });
  }

  scheduler0EventAdd(event: any) {
    this.dialogService.open(AddServicoComponent, { parameters: {start: event.start, end: event.end}, title: 'Add Servico' });
  }

  scheduler0EventUpdate(event: any) {
    this.projetoNew.updateServico(null, event.index_servicos, event)
    .subscribe((result: any) => {

    }, (result: any) => {
      this.notificationService.notify({ severity: "error", summary: `Error`, detail: `Unable to update Servico` });
    });
  }
}
