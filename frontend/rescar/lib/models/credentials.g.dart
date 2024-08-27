// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Credentials _$$_CredentialsFromJson(Map<String, dynamic> json) =>
    _$_Credentials(
      email: json['email'] as String,
      senha: json['senha'] as String,
    );

Map<String, dynamic> _$$_CredentialsToJson(_$_Credentials instance) =>
    <String, dynamic>{
      'email': instance.email,
      'senha': instance.senha,
    };

_$_InfoUsuario _$$_InfoUsuarioFromJson(Map<String, dynamic> json) =>
    _$_InfoUsuario(
      nome: json['nome'] as String,
      id: json['id'] as String,
      exp: (json['exp'] as num).toDouble(),
      iat: (json['iat'] as num).toDouble(),
      email: json['email'] as String,
      perfil: json['perfil'] as String,
      jwt: json['jwt'] as String,
    );

Map<String, dynamic> _$$_InfoUsuarioToJson(_$_InfoUsuario instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'id': instance.id,
      'exp': instance.exp,
      'iat': instance.iat,
      'email': instance.email,
      'perfil': instance.perfil,
      'jwt': instance.jwt,
    };
