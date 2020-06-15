import { Injectable } from '@angular/core';
import { Location } from '@angular/common';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, BehaviorSubject, throwError } from 'rxjs';

import { ConfigService } from './config.service';
import { ODataClient } from './odata-client';
import * as models from './projeto-new.model';

@Injectable()
export class ProjetoNewService {
  odata: ODataClient;
  basePath: string;

  constructor(private http: HttpClient, private config: ConfigService) {
    this.basePath = config.get('projetoNew');
    this.odata = new ODataClient(this.http, this.basePath, { legacy: false, withCredentials: true });
  }

  getFormacaos(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Formacaos`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createFormacao(expand: string | null, formacao: models.Formacao | null) : Observable<any> {
    return this.odata.post(`/Formacaos`, formacao, { expand }, ['Recurso']);
  }

  deleteFormacao(indexFormacao: number | null) : Observable<any> {
    return this.odata.delete(`/Formacaos(${indexFormacao})`, item => !(item.index_formacao == indexFormacao));
  }

  getFormacaoByindexFormacao(expand: string | null, indexFormacao: number | null) : Observable<any> {
    return this.odata.getById(`/Formacaos(${indexFormacao})`, { expand });
  }

  updateFormacao(expand: string | null, indexFormacao: number | null, formacao: models.Formacao | null) : Observable<any> {
    return this.odata.patch(`/Formacaos(${indexFormacao})`, formacao, item => item.index_formacao == indexFormacao, { expand }, ['Recurso']);
  }

  getProdutos(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Produtos`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createProduto(expand: string | null, produto: models.Produto | null) : Observable<any> {
    return this.odata.post(`/Produtos`, produto, { expand }, ['Recurso']);
  }

  deleteProduto(indexProdutos: number | null) : Observable<any> {
    return this.odata.delete(`/Produtos(${indexProdutos})`, item => !(item.index_produtos == indexProdutos));
  }

  getProdutoByindexProdutos(expand: string | null, indexProdutos: number | null) : Observable<any> {
    return this.odata.getById(`/Produtos(${indexProdutos})`, { expand });
  }

  updateProduto(expand: string | null, indexProdutos: number | null, produto: models.Produto | null) : Observable<any> {
    return this.odata.patch(`/Produtos(${indexProdutos})`, produto, item => item.index_produtos == indexProdutos, { expand }, ['Recurso']);
  }

  getRecursos(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Recursos`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createRecurso(expand: string | null, recurso: models.Recurso | null) : Observable<any> {
    return this.odata.post(`/Recursos`, recurso, { expand }, []);
  }

  deleteRecurso(indexRecurso: number | null) : Observable<any> {
    return this.odata.delete(`/Recursos(${indexRecurso})`, item => !(item.index_Recurso == indexRecurso));
  }

  getRecursoByindexRecurso(expand: string | null, indexRecurso: number | null) : Observable<any> {
    return this.odata.getById(`/Recursos(${indexRecurso})`, { expand });
  }

  updateRecurso(expand: string | null, indexRecurso: number | null, recurso: models.Recurso | null) : Observable<any> {
    return this.odata.patch(`/Recursos(${indexRecurso})`, recurso, item => item.index_Recurso == indexRecurso, { expand }, []);
  }
}
