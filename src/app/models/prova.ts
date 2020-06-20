import { Questao } from './questao';
import { Resultado } from './resultado';

export interface Prova {

idProva: number;
dataProva: number;
tbQuestaoList: Questao[];
tbResultadoList: Resultado[];

}
