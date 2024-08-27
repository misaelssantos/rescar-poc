// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario.freezed.dart';
part 'usuario.g.dart';

  // {
  //   "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  //   "email": "string",
  //   "nome": "string",
  //   "perfil": "string",
  //   "situacao": "string",
  //   "endereco": {
  //     "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  //     "cep": "string",
  //     "logradouro": "string",
  //     "complemento": "string",
  //     "numero": "string",
  //     "bairro": "string",
  //     "localidade": "string",
  //     "uf": "string"
  //   }
  // }

@freezed
class Usuario with _$Usuario {
  factory Usuario({String? id,
      String? nome,
      String? email,
      String? senha,
      String? perfil,
      String? situacao,
      Endereco? endereco}) = _Usuario;
  factory Usuario.fromJson(Map<String, dynamic> json) => _$UsuarioFromJson(json);
}

@freezed
class DadosBasicos with _$DadosBasicos {
  factory DadosBasicos({
      String? nome,
      String? email,
      String? senha,}) = _DadosBasicos;
  factory DadosBasicos.fromJson(Map<String, dynamic> json) => _$DadosBasicosFromJson(json);
}

@freezed
class Endereco with _$Endereco {
  factory Endereco({ String? id,
      String? cep,
      String? logradouro,
      String? complemento,
      String? numero,
      String? bairro,
      String? localidade,
      String? uf,}) = _Endereco;
  factory Endereco.fromJson(Map<String, dynamic> json) => _$EnderecoFromJson(json);
}

@freezed
class Situacao with _$Situacao {
  factory Situacao({
      required String situacao}) = _Situacao;
  factory Situacao.fromJson(Map<String, dynamic> json) => _$SituacaoFromJson(json);
}

@freezed
class Perfil with _$Perfil {
  factory Perfil({
      required String perfil}) = _Perfil;
  factory Perfil.fromJson(Map<String, dynamic> json) => _$PerfilFromJson(json);
}