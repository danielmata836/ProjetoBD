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

  getEquipamentos(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Equipamentos`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createEquipamento(expand: string | null, equipamento: models.Equipamento | null) : Observable<any> {
    return this.odata.post(`/Equipamentos`, equipamento, { expand }, ['Recurso']);
  }

  deleteEquipamento(noRegisProduto: number | null) : Observable<any> {
    return this.odata.delete(`/Equipamentos(${noRegisProduto})`, item => !(item.no_regis_produto == noRegisProduto));
  }

  getEquipamentoBynoRegisProduto(expand: string | null, noRegisProduto: number | null) : Observable<any> {
    return this.odata.getById(`/Equipamentos(${noRegisProduto})`, { expand });
  }

  updateEquipamento(expand: string | null, noRegisProduto: number | null, equipamento: models.Equipamento | null) : Observable<any> {
    return this.odata.patch(`/Equipamentos(${noRegisProduto})`, equipamento, item => item.no_regis_produto == noRegisProduto, { expand }, ['Recurso']);
  }

  getEstaAtribuidos(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/EstaAtribuidos`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createEstaAtribuido(expand: string | null, estaAtribuido: models.EstaAtribuido | null) : Observable<any> {
    return this.odata.post(`/EstaAtribuidos`, estaAtribuido, { expand }, ['Recurso', 'Servico']);
  }

  getGts(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Gts`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createGt(expand: string | null, gt: models.Gt | null) : Observable<any> {
    return this.odata.post(`/Gts`, gt, { expand }, []);
  }

  deleteGt(idGt: number | null) : Observable<any> {
    return this.odata.delete(`/Gts(${idGt})`, item => !(item.id_GT == idGt));
  }

  getGtByidGt(expand: string | null, idGt: number | null) : Observable<any> {
    return this.odata.getById(`/Gts(${idGt})`, { expand });
  }

  updateGt(expand: string | null, idGt: number | null, gt: models.Gt | null) : Observable<any> {
    return this.odata.patch(`/Gts(${idGt})`, gt, item => item.id_GT == idGt, { expand }, []);
  }

  getInstituicaos(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Instituicaos`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createInstituicao(expand: string | null, instituicao: models.Instituicao | null) : Observable<any> {
    return this.odata.post(`/Instituicaos`, instituicao, { expand }, []);
  }

  deleteInstituicao(numInst: number | null) : Observable<any> {
    return this.odata.delete(`/Instituicaos(${numInst})`, item => !(item.Num_Inst == numInst));
  }

  getInstituicaoByNumInst(expand: string | null, numInst: number | null) : Observable<any> {
    return this.odata.getById(`/Instituicaos(${numInst})`, { expand });
  }

  updateInstituicao(expand: string | null, numInst: number | null, instituicao: models.Instituicao | null) : Observable<any> {
    return this.odata.patch(`/Instituicaos(${numInst})`, instituicao, item => item.Num_Inst == numInst, { expand }, []);
  }

  getPedes(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Pedes`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createPede(expand: string | null, pede: models.Pede | null) : Observable<any> {
    return this.odata.post(`/Pedes`, pede, { expand }, ['Pessoa', 'Servico']);
  }

  getPertenceUis(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/PertenceUis`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createPertenceUi(expand: string | null, pertenceUi: models.PertenceUi | null) : Observable<any> {
    return this.odata.post(`/PertenceUis`, pertenceUi, { expand }, ['Ui', 'Pessoa']);
  }

  getPertencers(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Pertencers`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createPertencer(expand: string | null, pertencer: models.Pertencer | null) : Observable<any> {
    return this.odata.post(`/Pertencers`, pertencer, { expand }, ['Instituicao', 'Equipamento']);
  }

  getPessoas(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Pessoas`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createPessoa(expand: string | null, pessoa: models.Pessoa | null) : Observable<any> {
    return this.odata.post(`/Pessoas`, pessoa, { expand }, ['Servico', 'Instituicao', 'Gt']);
  }

  deletePessoa(idPessoa: number | null) : Observable<any> {
    return this.odata.delete(`/Pessoas(${idPessoa})`, item => !(item.id_Pessoa == idPessoa));
  }

  getPessoaByidPessoa(expand: string | null, idPessoa: number | null) : Observable<any> {
    return this.odata.getById(`/Pessoas(${idPessoa})`, { expand });
  }

  updatePessoa(expand: string | null, idPessoa: number | null, pessoa: models.Pessoa | null) : Observable<any> {
    return this.odata.patch(`/Pessoas(${idPessoa})`, pessoa, item => item.id_Pessoa == idPessoa, { expand }, ['Servico','Instituicao','Gt']);
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

  getServicos(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Servicos`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createServico(expand: string | null, servico: models.Servico | null) : Observable<any> {
    return this.odata.post(`/Servicos`, servico, { expand }, ['Gt']);
  }

  deleteServico(indexServicos: number | null) : Observable<any> {
    return this.odata.delete(`/Servicos(${indexServicos})`, item => !(item.index_servicos == indexServicos));
  }

  getServicoByindexServicos(expand: string | null, indexServicos: number | null) : Observable<any> {
    return this.odata.getById(`/Servicos(${indexServicos})`, { expand });
  }

  updateServico(expand: string | null, indexServicos: number | null, servico: models.Servico | null) : Observable<any> {
    return this.odata.patch(`/Servicos(${indexServicos})`, servico, item => item.index_servicos == indexServicos, { expand }, ['Gt']);
  }

  getUis(filter: string | null, top: number | null, skip: number | null, orderby: string | null, count: boolean | null, expand: string | null, format: string | null, select: string | null) : Observable<any> {
    return this.odata.get(`/Uis`, { filter, top, skip, orderby, count, expand, format, select });
  }

  createUi(expand: string | null, ui: models.Ui | null) : Observable<any> {
    return this.odata.post(`/Uis`, ui, { expand }, []);
  }

  deleteUi(idUi: number | null) : Observable<any> {
    return this.odata.delete(`/Uis(${idUi})`, item => !(item.id_UI == idUi));
  }

  getUiByidUi(expand: string | null, idUi: number | null) : Observable<any> {
    return this.odata.getById(`/Uis(${idUi})`, { expand });
  }

  updateUi(expand: string | null, idUi: number | null, ui: models.Ui | null) : Observable<any> {
    return this.odata.patch(`/Uis(${idUi})`, ui, item => item.id_UI == idUi, { expand }, []);
  }

  deleteEstaAtribuido(indexRecurso: number | null, indexServicos: number | null) : Observable<any> {
    return this.odata.delete(`/EstaAtribuidos(index_Recurso=${indexRecurso},index_servicos=${indexServicos})`, item => !(item.index_Recurso == indexRecurso && item.index_servicos == indexServicos));
  }

  getEstaAtribuidoByIndexRecursoAndIndexServicos(indexRecurso: number | null, indexServicos: number | null, expand: string | null) : Observable<any> {
    return this.odata.getById(`/EstaAtribuidos(index_Recurso=${indexRecurso},index_servicos=${indexServicos})`, { expand });
  }

  updateEstaAtribuido(indexRecurso: number | null, indexServicos: number | null, expand: string | null, estaAtribuido: models.EstaAtribuido | null) : Observable<any> {
    return this.odata.patch(`/EstaAtribuidos(index_Recurso=${indexRecurso},index_servicos=${indexServicos})`, estaAtribuido, item => item.index_Recurso == indexRecurso && item.index_servicos == indexServicos, { expand }, ['Recurso','Servico']);
  }

  deletePede(idPessoa: number | null, indexServicos: number | null) : Observable<any> {
    return this.odata.delete(`/Pedes(id_Pessoa=${idPessoa},index_servicos=${indexServicos})`, item => !(item.id_Pessoa == idPessoa && item.index_servicos == indexServicos));
  }

  getPedeByIdPessoaAndIndexServicos(idPessoa: number | null, indexServicos: number | null, expand: string | null) : Observable<any> {
    return this.odata.getById(`/Pedes(id_Pessoa=${idPessoa},index_servicos=${indexServicos})`, { expand });
  }

  updatePede(idPessoa: number | null, indexServicos: number | null, expand: string | null, pede: models.Pede | null) : Observable<any> {
    return this.odata.patch(`/Pedes(id_Pessoa=${idPessoa},index_servicos=${indexServicos})`, pede, item => item.id_Pessoa == idPessoa && item.index_servicos == indexServicos, { expand }, ['Pessoa','Servico']);
  }

  deletePertenceUi(idUi: number | null, idPessoa: number | null) : Observable<any> {
    return this.odata.delete(`/PertenceUis(id_UI=${idUi},id_Pessoa=${idPessoa})`, item => !(item.id_UI == idUi && item.id_Pessoa == idPessoa));
  }

  getPertenceUiByIdUiAndIdPessoa(idUi: number | null, idPessoa: number | null, expand: string | null) : Observable<any> {
    return this.odata.getById(`/PertenceUis(id_UI=${idUi},id_Pessoa=${idPessoa})`, { expand });
  }

  updatePertenceUi(idUi: number | null, idPessoa: number | null, expand: string | null, pertenceUi: models.PertenceUi | null) : Observable<any> {
    return this.odata.patch(`/PertenceUis(id_UI=${idUi},id_Pessoa=${idPessoa})`, pertenceUi, item => item.id_UI == idUi && item.id_Pessoa == idPessoa, { expand }, ['Ui','Pessoa']);
  }

  deletePertencer(numInst: number | null, noRegisProduto: number | null) : Observable<any> {
    return this.odata.delete(`/Pertencers(Num_Inst=${numInst},no_regis_produto=${noRegisProduto})`, item => !(item.Num_Inst == numInst && item.no_regis_produto == noRegisProduto));
  }

  getPertencerByNumInstAndNoRegisProduto(numInst: number | null, noRegisProduto: number | null, expand: string | null) : Observable<any> {
    return this.odata.getById(`/Pertencers(Num_Inst=${numInst},no_regis_produto=${noRegisProduto})`, { expand });
  }

  updatePertencer(numInst: number | null, noRegisProduto: number | null, expand: string | null, pertencer: models.Pertencer | null) : Observable<any> {
    return this.odata.patch(`/Pertencers(Num_Inst=${numInst},no_regis_produto=${noRegisProduto})`, pertencer, item => item.Num_Inst == numInst && item.no_regis_produto == noRegisProduto, { expand }, ['Instituicao','Equipamento']);
  }
}
