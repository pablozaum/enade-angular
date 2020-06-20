import { TipoUsuario } from './tipo-usuario';
import { Resultado } from './resultado';

export interface Usuario {

  idUsuario: number;
  nomeUsuario: string;
  emailUsuario: string;
  senhaUsuario: string;
  tbTipoUsuarioidTipoUsuario: TipoUsuario.idTipoUsuario;
  tbResultadoList: Resultado[];

}
