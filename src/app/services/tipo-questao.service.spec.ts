import { TestBed } from '@angular/core/testing';

import { TipoQuestaoService } from './tipo-questao.service';

describe('TipoQuestaoService', () => {
  let service: TipoQuestaoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TipoQuestaoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
