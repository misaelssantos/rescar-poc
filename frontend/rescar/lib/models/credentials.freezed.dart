// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return _Credentials.fromJson(json);
}

/// @nodoc
mixin _$Credentials {
  String get email => throw _privateConstructorUsedError;
  String get senha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CredentialsCopyWith<Credentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredentialsCopyWith<$Res> {
  factory $CredentialsCopyWith(
          Credentials value, $Res Function(Credentials) then) =
      _$CredentialsCopyWithImpl<$Res, Credentials>;
  @useResult
  $Res call({String email, String senha});
}

/// @nodoc
class _$CredentialsCopyWithImpl<$Res, $Val extends Credentials>
    implements $CredentialsCopyWith<$Res> {
  _$CredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? senha = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      senha: null == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CredentialsCopyWith<$Res>
    implements $CredentialsCopyWith<$Res> {
  factory _$$_CredentialsCopyWith(
          _$_Credentials value, $Res Function(_$_Credentials) then) =
      __$$_CredentialsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String senha});
}

/// @nodoc
class __$$_CredentialsCopyWithImpl<$Res>
    extends _$CredentialsCopyWithImpl<$Res, _$_Credentials>
    implements _$$_CredentialsCopyWith<$Res> {
  __$$_CredentialsCopyWithImpl(
      _$_Credentials _value, $Res Function(_$_Credentials) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? senha = null,
  }) {
    return _then(_$_Credentials(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      senha: null == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Credentials implements _Credentials {
  _$_Credentials({required this.email, required this.senha});

  factory _$_Credentials.fromJson(Map<String, dynamic> json) =>
      _$$_CredentialsFromJson(json);

  @override
  final String email;
  @override
  final String senha;

  @override
  String toString() {
    return 'Credentials(email: $email, senha: $senha)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Credentials &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.senha, senha) || other.senha == senha));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, senha);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CredentialsCopyWith<_$_Credentials> get copyWith =>
      __$$_CredentialsCopyWithImpl<_$_Credentials>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CredentialsToJson(
      this,
    );
  }
}

abstract class _Credentials implements Credentials {
  factory _Credentials(
      {required final String email,
      required final String senha}) = _$_Credentials;

  factory _Credentials.fromJson(Map<String, dynamic> json) =
      _$_Credentials.fromJson;

  @override
  String get email;
  @override
  String get senha;
  @override
  @JsonKey(ignore: true)
  _$$_CredentialsCopyWith<_$_Credentials> get copyWith =>
      throw _privateConstructorUsedError;
}

InfoUsuario _$InfoUsuarioFromJson(Map<String, dynamic> json) {
  return _InfoUsuario.fromJson(json);
}

/// @nodoc
mixin _$InfoUsuario {
  String get nome => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  double get exp => throw _privateConstructorUsedError;
  double get iat => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get perfil => throw _privateConstructorUsedError;
  String get jwt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InfoUsuarioCopyWith<InfoUsuario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoUsuarioCopyWith<$Res> {
  factory $InfoUsuarioCopyWith(
          InfoUsuario value, $Res Function(InfoUsuario) then) =
      _$InfoUsuarioCopyWithImpl<$Res, InfoUsuario>;
  @useResult
  $Res call(
      {String nome,
      String id,
      double exp,
      double iat,
      String email,
      String perfil,
      String jwt});
}

/// @nodoc
class _$InfoUsuarioCopyWithImpl<$Res, $Val extends InfoUsuario>
    implements $InfoUsuarioCopyWith<$Res> {
  _$InfoUsuarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? id = null,
    Object? exp = null,
    Object? iat = null,
    Object? email = null,
    Object? perfil = null,
    Object? jwt = null,
  }) {
    return _then(_value.copyWith(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as double,
      iat: null == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as double,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InfoUsuarioCopyWith<$Res>
    implements $InfoUsuarioCopyWith<$Res> {
  factory _$$_InfoUsuarioCopyWith(
          _$_InfoUsuario value, $Res Function(_$_InfoUsuario) then) =
      __$$_InfoUsuarioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nome,
      String id,
      double exp,
      double iat,
      String email,
      String perfil,
      String jwt});
}

/// @nodoc
class __$$_InfoUsuarioCopyWithImpl<$Res>
    extends _$InfoUsuarioCopyWithImpl<$Res, _$_InfoUsuario>
    implements _$$_InfoUsuarioCopyWith<$Res> {
  __$$_InfoUsuarioCopyWithImpl(
      _$_InfoUsuario _value, $Res Function(_$_InfoUsuario) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = null,
    Object? id = null,
    Object? exp = null,
    Object? iat = null,
    Object? email = null,
    Object? perfil = null,
    Object? jwt = null,
  }) {
    return _then(_$_InfoUsuario(
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as double,
      iat: null == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as double,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InfoUsuario extends _InfoUsuario {
  _$_InfoUsuario(
      {required this.nome,
      required this.id,
      required this.exp,
      required this.iat,
      required this.email,
      required this.perfil,
      required this.jwt})
      : super._();

  factory _$_InfoUsuario.fromJson(Map<String, dynamic> json) =>
      _$$_InfoUsuarioFromJson(json);

  @override
  final String nome;
  @override
  final String id;
  @override
  final double exp;
  @override
  final double iat;
  @override
  final String email;
  @override
  final String perfil;
  @override
  final String jwt;

  @override
  String toString() {
    return 'InfoUsuario(nome: $nome, id: $id, exp: $exp, iat: $iat, email: $email, perfil: $perfil, jwt: $jwt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InfoUsuario &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.iat, iat) || other.iat == iat) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.perfil, perfil) || other.perfil == perfil) &&
            (identical(other.jwt, jwt) || other.jwt == jwt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nome, id, exp, iat, email, perfil, jwt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InfoUsuarioCopyWith<_$_InfoUsuario> get copyWith =>
      __$$_InfoUsuarioCopyWithImpl<_$_InfoUsuario>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InfoUsuarioToJson(
      this,
    );
  }
}

abstract class _InfoUsuario extends InfoUsuario {
  factory _InfoUsuario(
      {required final String nome,
      required final String id,
      required final double exp,
      required final double iat,
      required final String email,
      required final String perfil,
      required final String jwt}) = _$_InfoUsuario;
  _InfoUsuario._() : super._();

  factory _InfoUsuario.fromJson(Map<String, dynamic> json) =
      _$_InfoUsuario.fromJson;

  @override
  String get nome;
  @override
  String get id;
  @override
  double get exp;
  @override
  double get iat;
  @override
  String get email;
  @override
  String get perfil;
  @override
  String get jwt;
  @override
  @JsonKey(ignore: true)
  _$$_InfoUsuarioCopyWith<_$_InfoUsuario> get copyWith =>
      throw _privateConstructorUsedError;
}
