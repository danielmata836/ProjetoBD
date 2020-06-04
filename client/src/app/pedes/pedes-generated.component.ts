/*
  This file is automatically generated. Any changes will be overwritten.
  Modify pedes.component.ts instead.
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
import { GridComponent } from '@radzen/angular/dist/grid';

import { ConfigService } from '../config.service';
import { AddPedeComponent } from '../add-pede/add-pede.component';
import { EditPedeComponent } from '../edit-pede/edit-pede.component';

import { ProjetoNewService } from '../projeto-new.service';

export class PedesGenerated implements AfterViewInit, OnInit, OnDestroy {
  // Components
  @ViewChild('content1') content1: ContentComponent;
  @ViewChild('pageTitle') pageTitle: HeadingComponent;
  @ViewChild('grid0') grid0: GridComponent;

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
  parameters: any;
  getPedesResult: any;
  getPedesCount: any;

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
    this.grid0.load();
  }

  grid0LoadData(event: any) {
    this.projetoNew.getPedes(`${event.filter}`, event.top, event.skip, `${event.orderby}`, event.top != null && event.skip != null, `Pessoa,Servico`, null, null)
    .subscribe((result: any) => {
      this.getPedesResult = result.value;

      this.getPedesCount = event.top != null && event.skip != null ? result['@odata.count'] : result.value.length;
    }, (result: any) => {
      this.notificationService.notify({ severity: "error", summary: `Error`, detail: `Unable to load Pedes` });
    });
  }

  grid0Delete(event: any) {
    this.projetoNew.deletePede(event.id_Pessoa, event.index_servicos)
    .subscribe((result: any) => {
      this.notificationService.notify({ severity: "success", summary: `Success`, detail: `Pede deleted!` });
    }, (result: any) => {
      this.notificationService.notify({ severity: "error", summary: `Error`, detail: `Unable to delete Pede` });
    });
  }

  grid0Add(event: any) {
    this.dialogService.open(AddPedeComponent, { parameters: {}, title: 'Add Pede' });
  }

  grid0RowSelect(event: any) {
    this.dialogService.open(EditPedeComponent, { parameters: {id_Pessoa: event.id_Pessoa, index_servicos: event.index_servicos}, title: 'Edit Pede' });
  }
}
