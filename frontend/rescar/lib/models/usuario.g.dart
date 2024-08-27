// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Usuario _$$_UsuarioFromJson(Map<String, dynamic> json) => _$_Usuario(
      id: json['id'] as String?,
      nome: json['nome'] as String?,
      email: json['email'] as String?,
      senha: json['senha'] as String?,
      perfil: json['perfil'] as String?,
      situacao: json['situacao'] as String?,
      endereco: json['endereco'] == null
          ? null
          : Endereco.fromJson(json['endereco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UsuarioToJson(_$_Usuario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'senha': instance.senha,
      'perfil': instance.perfil,
      'situacao': instance.situacao,
      'endereco': instance.endereco,
    };

_$_DadosBasicos _$$_DadosBasicosFromJson(Map<String, dynamic> json) =>
    _$_DadosBasicos(
      nome: json['nome'] as String?,
      email: json['email'] as String?,
      senha: json['senha'] as String?,
    );

Map<String, dynamic> _$$_DadosBasicosToJson(_$_DadosBasicos instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'senha': instance.senha,
    };

_$_Endereco _$$_EnderecoFromJson(Map<String, dynamic> json) => _$_Endereco(
      id: json['id'] as String?,
      cep: json['cep'] as String?,
      logradouro: json['logradouro'] as String?,
      complemento: json['complemento'] as String?,
      numero: json['numero'] as String?,
      bairro: json['bairro'] as String?,
      localidade: json['localidade'] as String?,
      uf: json['uf'] as String?,
    );

Map<String, dynamic> _$$_EnderecoToJson(_$_Endereco instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'numero': instance.numero,
      'bairro': instance.bairro,
      'localidade': instance.localidade,
      'uf': instance.uf,
    };

_$_Situacao _$$_SituacaoFromJson(Map<String, dynamic> json) => _$_Situacao(
      situacao: json['situacao'] as String,
    );

Map<String, dynamic> _$$_SituacaoToJson(_$_Situacao instance) =>
    <String, dynamic>{
      'situacao': instance.situacao,
    };

_$_Perfil _$$_PerfilFromJson(Map<String, dynamic> json) => _$_Perfil(
      perfil: json['perfil'] as String,
    );

Map<String, dynamic> _$$_PerfilToJson(_$_Perfil instance) => <String, dynamic>{
      'perfil': instance.perfil,
    };
