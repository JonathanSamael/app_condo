enum EstadoCivil {
  solteiro,
  casado,
  divorciado,
  viuvo,
}

extension EstadoCivilExt on EstadoCivil {
  static EstadoCivil fromInt(int value) {
    switch (value) {
      case 1:
        return EstadoCivil.solteiro;
      case 2:
        return EstadoCivil.casado;
      case 3:
        return EstadoCivil.divorciado;
      case 4:
        return EstadoCivil.viuvo;
      default:
        return EstadoCivil.solteiro;
    }
  }

  String get label {
    switch (this) {
      case EstadoCivil.solteiro:
        return 'Solteiro(a)';
      case EstadoCivil.casado:
        return 'Casado(a)';
      case EstadoCivil.divorciado:
        return 'Divorciado(a)';
      case EstadoCivil.viuvo:
        return 'Viúvo(a)';
    }
  }

  int toInt() {
    switch (this) {
      case EstadoCivil.solteiro:
        return 1;
      case EstadoCivil.casado:
        return 2;
      case EstadoCivil.divorciado:
        return 3;
      case EstadoCivil.viuvo:
        return 4;
      default:
        return 1;
    }
  }
}

enum Sexo {
  masculino,
  feminino,
  outro,
}

extension SexoExt on Sexo {
  static Sexo fromInt(int value) {
    switch (value) {
      case 1:
        return Sexo.masculino;
      case 2:
        return Sexo.feminino;
      case 3:
      default:
        return Sexo.outro;
    }
  }

  String get label {
    switch (this) {
      case Sexo.masculino:
        return 'Masculino';
      case Sexo.feminino:
        return 'Feminino';
      case Sexo.outro:
        return 'Outro';
    }
  }

  int toInt() {
    switch (this) {
      case Sexo.masculino:
        return 1;
      case Sexo.feminino:
        return 2;
      case Sexo.outro:
      default:
        return 3;
    }
  }
}

enum TipoCondomino {
  proprietario,
  locatario,
  residente,
  nenhum,
}

extension TipoCondominoExt on TipoCondomino {
  static TipoCondomino fromInt(int value) {
    switch (value) {
      case 1:
        return TipoCondomino.proprietario;
      case 2:
        return TipoCondomino.locatario;
      case 3:
        return TipoCondomino.residente;
      case 4:
      default:
        return TipoCondomino.nenhum;
    }
  }

  String get label {
    switch (this) {
      case TipoCondomino.proprietario:
        return 'Proprietário';
      case TipoCondomino.locatario:
        return 'Locatário';
      case TipoCondomino.residente:
        return 'Residente';
      case TipoCondomino.nenhum:
        return 'Nenhum';
    }
  }

  int toInt() {
    switch (this) {
      case TipoCondomino.proprietario:
        return 1;
      case TipoCondomino.locatario:
        return 2;
      case TipoCondomino.residente:
        return 3;
      case TipoCondomino.nenhum:
      default:
        return 4;
    }
  }
}

enum TipoPessoa {
  fisica,
  juridica,
}

extension TipoPessoaExt on TipoPessoa {
  static TipoPessoa fromInt(int value) {
    switch (value) {
      case 1:
        return TipoPessoa.fisica;
      case 2:
        return TipoPessoa.juridica;
      default:
        return TipoPessoa.fisica;
    }
  }

  String get label {
    switch (this) {
      case TipoPessoa.fisica:
        return 'Pessoa Física';
      case TipoPessoa.juridica:
        return 'Pessoa Jurídica';
    }
  }

  int toInt() {
    switch (this) {
      case TipoPessoa.fisica:
        return 1;
      case TipoPessoa.juridica:
        return 2;
      default:
        return 1;
    }
  }
}

enum TipoContato {
  email,
  telefone,
  celular,
  whatsapp,
}

extension TipoContatoExt on TipoContato {
  static TipoContato fromInt(int value) {
    switch (value) {
      case 1:
        return TipoContato.email;
      case 2:
        return TipoContato.telefone;
      case 3:
        return TipoContato.celular;
      case 4:
      default:
        return TipoContato.whatsapp;
    }
  }

  String get label {
    switch (this) {
      case TipoContato.email:
        return 'Email';
      case TipoContato.telefone:
        return 'Telefone';
      case TipoContato.celular:
        return 'Celular';
      case TipoContato.whatsapp:
        return 'WhatsApp';
    }
  }

  int toInt() {
    switch (this) {
      case TipoContato.telefone:
        return 0;
      case TipoContato.celular:
        return 1;
      case TipoContato.email:
        return 2;
      case TipoContato.whatsapp:
      default:
        return 0;
    }
  }
}

enum TipoDocumento {
  cpf,
  cnpj,
  rg,
  cnh,
  passaporte,
}

extension TipoDocumentoExt on TipoDocumento {
  static TipoDocumento fromInt(int value) {
    switch (value) {
      case 1:
        return TipoDocumento.cpf;
      case 2:
        return TipoDocumento.cnpj;
      case 3:
        return TipoDocumento.rg;
      case 4:
        return TipoDocumento.cnh;
      case 5:
        return TipoDocumento.passaporte;
      default:
        return TipoDocumento.cpf;
    }
  }

  String get label {
    switch (this) {
      case TipoDocumento.cpf:
        return 'CPF';
      case TipoDocumento.cnpj:
        return 'CNPJ';
      case TipoDocumento.rg:
        return 'RG';
      case TipoDocumento.cnh:
        return 'CNH';
      case TipoDocumento.passaporte:
        return 'Passaporte';
    }
  }

  int toInt() {
    switch (this) {
      case TipoDocumento.cpf:
        return 1;
      case TipoDocumento.cnpj:
        return 2;
      case TipoDocumento.rg:
        return 4;
      case TipoDocumento.cnh:
        return 5;
      case TipoDocumento.passaporte:
      default:
        return 1;
    }
  }
}

enum TipoEndereco {
  loja,
  deposito,
  correspondencia,
}

extension TipoEnderecoExt on TipoEndereco {
  static TipoEndereco fromInt(int value) {
    switch (value) {
      case 1:
        return TipoEndereco.loja;
      case 2:
        return TipoEndereco.deposito;
      case 3:
      default:
        return TipoEndereco.correspondencia;
    }
  }

  String get label {
    switch (this) {
      case TipoEndereco.loja:
        return 'Loja';
      case TipoEndereco.deposito:
        return 'Depósito';
      case TipoEndereco.correspondencia:
        return 'Correspondência';
    }
  }

  int toInt() {
    switch (this) {
      case TipoEndereco.loja:
        return 1;
      case TipoEndereco.deposito:
        return 2;
      case TipoEndereco.correspondencia:
      default:
        return 3;
    }
  }
}

enum TipoUnidade {
  lote,
  casa,
  apartamento,
  sala,
}

extension TipoUnidadeExt on TipoUnidade {
  static TipoUnidade fromInt(int value) {
    switch (value) {
      case 1:
        return TipoUnidade.lote;
      case 2:
        return TipoUnidade.casa;
      case 3:
        return TipoUnidade.apartamento;
      case 4:
      default:
        return TipoUnidade.sala;
    }
  }

  String get label {
    switch (this) {
      case TipoUnidade.lote:
        return 'Lote';
      case TipoUnidade.casa:
        return 'Casa';
      case TipoUnidade.apartamento:
        return 'Apartamento';
      case TipoUnidade.sala:
        return 'Sala';
    }
  }
}

enum Area {
  interna,
  externa,
}

extension AreaExt on Area {
  static Area fromInt(int value) {
    return value == 1 ? Area.interna : Area.externa;
  }

  String get label => this == Area.interna ? 'Interna' : 'Externa';
}

enum Status {
  entrada,
  saida,
}

extension StatusExt on Status {
  static Status fromInt(int value) {
    return value == 1 ? Status.entrada : Status.saida;
  }

  String get label => this == Status.entrada ? 'Entrada' : 'Saída';
}
