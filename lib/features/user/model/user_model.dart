import 'dart:convert';

import 'package:app_condo/app/utils/enums.dart';

class ContatoModel {
  final TipoContato tipo;
  final String contato;
  final String responsavel;

  ContatoModel({
    required this.tipo,
    required this.contato,
    required this.responsavel,
  });

  factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      tipo: TipoContatoExt.fromInt(map['TipoContato']),
      contato: map['Contato'],
      responsavel: map['Responsavel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TipoContato': tipo.toInt(),
      'Contato': contato,
      'Responsavel': responsavel,
    };
  }
}

class DocumentoModel {
  final TipoDocumento tipo;
  final String documento;
  final DateTime validade;

  DocumentoModel({
    required this.tipo,
    required this.documento,
    required this.validade,
  });

  factory DocumentoModel.fromMap(Map<String, dynamic> map) {
    return DocumentoModel(
      tipo: TipoDocumentoExt.fromInt(map['TipoDocumento']),
      documento: map['Documento'],
      validade: DateTime.parse(map['Validade']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TipoDocumento': tipo.toInt(),
      'Documento': documento,
      'Validade': validade,
    };
  }
}

class EnderecoModel {
  final TipoEndereco tipo;
  final String logradouro;
  final String? cep;
  final String numero;
  final String complemento;
  final String bairro;
  final String cidade;
  final String estado;
  final String pais;

  EnderecoModel({
    required this.tipo,
    required this.logradouro,
    required this.cep,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.pais,
  });

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      tipo: TipoEnderecoExt.fromInt(map['TipoEndereco']),
      logradouro: map['Logradouro'],
      cep: map['CEP'],
      numero: map['Numero'],
      complemento: map['Complemento'],
      bairro: map['Bairro'],
      cidade: map['Cidade'],
      estado: map['Estado'],
      pais: map['Pais'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'TipoEndereco': tipo.toInt(),
      'Logradouro': logradouro,
      'CEP': cep,
      'Numero': numero,
      'Complemento': complemento,
      'Bairro': bairro,
      'Cidade': cidade,
      'Estado': estado,
      'Pais': pais,
    };
  }
}

class UserModel {
  final int userId;
  final String nomeCompleto;
  final DateTime dataNascimento;
  final TipoPessoa tipoPessoa;
  final EstadoCivil estadoCivil;
  final Sexo sexo;
  final bool condomino;
  final bool fornecedor;
  final bool sindico;
  final bool funcionario;
  final TipoCondomino tipoCondomino;
  final String? foto;
  final bool isActive;
  final bool isFirstLogin;
  final String email;
  final List<ContatoModel> contatos;
  final List<DocumentoModel> documentos;
  final List<EnderecoModel> enderecos;

  UserModel({
    required this.userId,
    required this.nomeCompleto,
    required this.dataNascimento,
    required this.tipoPessoa,
    required this.estadoCivil,
    required this.sexo,
    required this.condomino,
    required this.fornecedor,
    required this.sindico,
    required this.funcionario,
    required this.tipoCondomino,
    required this.foto,
    required this.isActive,
    required this.isFirstLogin,
    required this.email,
    required this.contatos,
    required this.documentos,
    required this.enderecos,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final userMap = map['User'] ?? {};

    return UserModel(
      userId: userMap['UserId'],
      nomeCompleto: map['NomeCompleto'],
      dataNascimento: DateTime.parse(map['DataNascimento']),
      tipoPessoa: TipoPessoaExt.fromInt(map['TipoPessoa']),
      estadoCivil: EstadoCivilExt.fromInt(map['EstadoCivil']),
      sexo: SexoExt.fromInt(map['Sexo']),
      condomino: map['Condomino'],
      fornecedor: map['Fornecedor'],
      sindico: map['Sindico'],
      funcionario: map['Funcionario'],
      tipoCondomino: TipoCondominoExt.fromInt(map['TipoCondomino']),
      foto: map['Foto'],
      isActive: userMap['IsActive'],
      isFirstLogin: userMap['IsFirstLogin'],
      email: userMap['Email'],
      contatos: (map['Contatos'] as List)
          .map((c) => ContatoModel.fromMap(c))
          .toList(),
      documentos: (map['Documentos'] as List)
          .map((d) => DocumentoModel.fromMap(d))
          .toList(),
      enderecos: (map['Enderecos'] as List)
          .map((e) => EnderecoModel.fromMap(e))
          .toList(),
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'User': {
        'UserId': userId,
        'Email': email,
        'IsActive': isActive,
        'IsFirstLogin': isFirstLogin,
      },
      'NomeCompleto': nomeCompleto,
      'DataNascimento': dataNascimento.toIso8601String(),
      'TipoPessoa': tipoPessoa.toInt(),
      'EstadoCivil': estadoCivil.toInt(),
      'Sexo': sexo.toInt(),
      'Foto': foto,
      'Condomino': condomino,
      'Fornecedor': fornecedor,
      'Sindico': sindico,
      'Funcionario': funcionario,
      'TipoCondomino': tipoCondomino.toInt(),
      'Contatos': contatos.map((c) => c.toMap()).toList(),
      'Documentos': documentos.map((d) => d.toMap()).toList(),
      'Enderecos': enderecos.map((e) => e.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
