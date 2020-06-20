import { TipoQuestao } from './tipo-questao';
import { Prova } from './prova';

export interface Questao {

    idQuestao: number;
    descricaoQuestao: string;
    estadoQuestao: string;
    tbTipoQuestaoidTipoQuestao: TipoQuestao.idTipoQuestao;
    alternativaA: string;
    alternativaB: string;
    alternativaC: string;
    alternativaD: string;
    alternativaE: string;
    questaoCorreta: string;
    tbProvaList: Prova[];

}
