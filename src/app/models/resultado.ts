import { Usuario } from './usuario';
import { Prova } from './prova';

export interface Resultado {

idResultado: number;
valorObtido: number;
tbProvaidProva: Prova.idProva;
tbUsuarioidUsuario: Usuario.idUsuario;

}
