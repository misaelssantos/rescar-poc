// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return _Usuario.fromJson(json);
}

/// @nodoc
mixin _$Usuario {
  String? get id => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get senha => throw _privateConstructorUsedError;
  String? get perfil => throw _privateConstructorUsedError;
  String? get situacao => throw _privateConstructorUsedError;
  Endereco? get endereco => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsuarioCopyWith<Usuario> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioCopyWith<$Res> {
  factory $UsuarioCopyWith(Usuario value, $Res Function(Usuario) then) =
      _$UsuarioCopyWithImpl<$Res, Usuario>;
  @useResult
  $Res call(
      {String? id,
      String? nome,
      String? email,
      String? senha,
      String? perfil,
      String? situacao,
      Endereco? endereco});

  $EnderecoCopyWith<$Res>? get endereco;
}

/// @nodoc
class _$UsuarioCopyWithImpl<$Res, $Val extends Usuario>
    implements $UsuarioCopyWith<$Res> {
  _$UsuarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? email = freezed,
    Object? senha = freezed,
    Object? perfil = freezed,
    Object? situacao = freezed,
    Object? endereco = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
      perfil: freezed == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String?,
      endereco: freezed == endereco
          ? _value.endereco
          : endereco // ignore: cast_nullable_to_non_nullable
              as Endereco?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EnderecoCopyWith<$Res>? get endereco {
    if (_value.endereco == null) {
      return null;
    }

    return $EnderecoCopyWith<$Res>(_value.endereco!, (value) {
      return _then(_value.copyWith(endereco: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UsuarioCopyWith<$Res> implements $UsuarioCopyWith<$Res> {
  factory _$$_UsuarioCopyWith(
          _$_Usuario value, $Res Function(_$_Usuario) then) =
      __$$_UsuarioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? nome,
      String? email,
      String? senha,
      String? perfil,
      String? situacao,
      Endereco? endereco});

  @override
  $EnderecoCopyWith<$Res>? get endereco;
}

/// @nodoc
class __$$_UsuarioCopyWithImpl<$Res>
    extends _$UsuarioCopyWithImpl<$Res, _$_Usuario>
    implements _$$_UsuarioCopyWith<$Res> {
  __$$_UsuarioCopyWithImpl(_$_Usuario _value, $Res Function(_$_Usuario) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nome = freezed,
    Object? email = freezed,
    Object? senha = freezed,
    Object? perfil = freezed,
    Object? situacao = freezed,
    Object? endereco = freezed,
  }) {
    return _then(_$_Usuario(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
      perfil: freezed == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String?,
      endereco: freezed == endereco
          ? _value.endereco
          : endereco // ignore: cast_nullable_to_non_nullable
              as Endereco?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Usuario implements _Usuario {
  _$_Usuario(
      {this.id,
      this.nome,
      this.email,
      this.senha,
      this.perfil,
      this.situacao,
      this.endereco});

  factory _$_Usuario.fromJson(Map<String, dynamic> json) =>
      _$$_UsuarioFromJson(json);

  @override
  final String? id;
  @override
  final String? nome;
  @override
  final String? email;
  @override
  final String? senha;
  @override
  final String? perfil;
  @override
  final String? situacao;
  @override
  final Endereco? endereco;

  @override
  String toString() {
    return 'Usuario(id: $id, nome: $nome, email: $email, senha: $senha, perfil: $perfil, situacao: $situacao, endereco: $endereco)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Usuario &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.senha, senha) || other.senha == senha) &&
            (identical(other.perfil, perfil) || other.perfil == perfil) &&
            (identical(other.situacao, situacao) ||
                other.situacao == situacao) &&
            (identical(other.endereco, endereco) ||
                other.endereco == endereco));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nome, email, senha, perfil, situacao, endereco);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsuarioCopyWith<_$_Usuario> get copyWith =>
      __$$_UsuarioCopyWithImpl<_$_Usuario>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsuarioToJson(
      this,
    );
  }
}

abstract class _Usuario implements Usuario {
  factory _Usuario(
      {final String? id,
      final String? nome,
      final String? email,
      final String? senha,
      final String? perfil,
      final String? situacao,
      final Endereco? endereco}) = _$_Usuario;

  factory _Usuario.fromJson(Map<String, dynamic> json) = _$_Usuario.fromJson;

  @override
  String? get id;
  @override
  String? get nome;
  @override
  String? get email;
  @override
  String? get senha;
  @override
  String? get perfil;
  @override
  String? get situacao;
  @override
  Endereco? get endereco;
  @override
  @JsonKey(ignore: true)
  _$$_UsuarioCopyWith<_$_Usuario> get copyWith =>
      throw _privateConstructorUsedError;
}

DadosBasicos _$DadosBasicosFromJson(Map<String, dynamic> json) {
  return _DadosBasicos.fromJson(json);
}

/// @nodoc
mixin _$DadosBasicos {
  String? get nome => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get senha => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DadosBasicosCopyWith<DadosBasicos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DadosBasicosCopyWith<$Res> {
  factory $DadosBasicosCopyWith(
          DadosBasicos value, $Res Function(DadosBasicos) then) =
      _$DadosBasicosCopyWithImpl<$Res, DadosBasicos>;
  @useResult
  $Res call({String? nome, String? email, String? senha});
}

/// @nodoc
class _$DadosBasicosCopyWithImpl<$Res, $Val extends DadosBasicos>
    implements $DadosBasicosCopyWith<$Res> {
  _$DadosBasicosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? email = freezed,
    Object? senha = freezed,
  }) {
    return _then(_value.copyWith(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DadosBasicosCopyWith<$Res>
    implements $DadosBasicosCopyWith<$Res> {
  factory _$$_DadosBasicosCopyWith(
          _$_DadosBasicos value, $Res Function(_$_DadosBasicos) then) =
      __$$_DadosBasicosCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nome, String? email, String? senha});
}

/// @nodoc
class __$$_DadosBasicosCopyWithImpl<$Res>
    extends _$DadosBasicosCopyWithImpl<$Res, _$_DadosBasicos>
    implements _$$_DadosBasicosCopyWith<$Res> {
  __$$_DadosBasicosCopyWithImpl(
      _$_DadosBasicos _value, $Res Function(_$_DadosBasicos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nome = freezed,
    Object? email = freezed,
    Object? senha = freezed,
  }) {
    return _then(_$_DadosBasicos(
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      senha: freezed == senha
          ? _value.senha
          : senha // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DadosBasicos implements _DadosBasicos {
  _$_DadosBasicos({this.nome, this.email, this.senha});

  factory _$_DadosBasicos.fromJson(Map<String, dynamic> json) =>
      _$$_DadosBasicosFromJson(json);

  @override
  final String? nome;
  @override
  final String? email;
  @override
  final String? senha;

  @override
  String toString() {
    return 'DadosBasicos(nome: $nome, email: $email, senha: $senha)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DadosBasicos &&
            (identical(other.nome, nome) || other.nome == nome) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.senha, senha) || other.senha == senha));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nome, email, senha);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DadosBasicosCopyWith<_$_DadosBasicos> get copyWith =>
      __$$_DadosBasicosCopyWithImpl<_$_DadosBasicos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DadosBasicosToJson(
      this,
    );
  }
}

abstract class _DadosBasicos implements DadosBasicos {
  factory _DadosBasicos(
      {final String? nome,
      final String? email,
      final String? senha}) = _$_DadosBasicos;

  factory _DadosBasicos.fromJson(Map<String, dynamic> json) =
      _$_DadosBasicos.fromJson;

  @override
  String? get nome;
  @override
  String? get email;
  @override
  String? get senha;
  @override
  @JsonKey(ignore: true)
  _$$_DadosBasicosCopyWith<_$_DadosBasicos> get copyWith =>
      throw _privateConstructorUsedError;
}

Endereco _$EnderecoFromJson(Map<String, dynamic> json) {
  return _Endereco.fromJson(json);
}

/// @nodoc
mixin _$Endereco {
  String? get id => throw _privateConstructorUsedError;
  String? get cep => throw _privateConstructorUsedError;
  String? get logradouro => throw _privateConstructorUsedError;
  String? get complemento => throw _privateConstructorUsedError;
  String? get numero => throw _privateConstructorUsedError;
  String? get bairro => throw _privateConstructorUsedError;
  String? get localidade => throw _privateConstructorUsedError;
  String? get uf => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnderecoCopyWith<Endereco> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnderecoCopyWith<$Res> {
  factory $EnderecoCopyWith(Endereco value, $Res Function(Endereco) then) =
      _$EnderecoCopyWithImpl<$Res, Endereco>;
  @useResult
  $Res call(
      {String? id,
      String? cep,
      String? logradouro,
      String? complemento,
      String? numero,
      String? bairro,
      String? localidade,
      String? uf});
}

/// @nodoc
class _$EnderecoCopyWithImpl<$Res, $Val extends Endereco>
    implements $EnderecoCopyWith<$Res> {
  _$EnderecoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cep = freezed,
    Object? logradouro = freezed,
    Object? complemento = freezed,
    Object? numero = freezed,
    Object? bairro = freezed,
    Object? localidade = freezed,
    Object? uf = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      cep: freezed == cep
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as String?,
      logradouro: freezed == logradouro
          ? _value.logradouro
          : logradouro // ignore: cast_nullable_to_non_nullable
              as String?,
      complemento: freezed == complemento
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      numero: freezed == numero
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro: freezed == bairro
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String?,
      localidade: freezed == localidade
          ? _value.localidade
          : localidade // ignore: cast_nullable_to_non_nullable
              as String?,
      uf: freezed == uf
          ? _value.uf
          : uf // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnderecoCopyWith<$Res> implements $EnderecoCopyWith<$Res> {
  factory _$$_EnderecoCopyWith(
          _$_Endereco value, $Res Function(_$_Endereco) then) =
      __$$_EnderecoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? cep,
      String? logradouro,
      String? complemento,
      String? numero,
      String? bairro,
      String? localidade,
      String? uf});
}

/// @nodoc
class __$$_EnderecoCopyWithImpl<$Res>
    extends _$EnderecoCopyWithImpl<$Res, _$_Endereco>
    implements _$$_EnderecoCopyWith<$Res> {
  __$$_EnderecoCopyWithImpl(
      _$_Endereco _value, $Res Function(_$_Endereco) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cep = freezed,
    Object? logradouro = freezed,
    Object? complemento = freezed,
    Object? numero = freezed,
    Object? bairro = freezed,
    Object? localidade = freezed,
    Object? uf = freezed,
  }) {
    return _then(_$_Endereco(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      cep: freezed == cep
          ? _value.cep
          : cep // ignore: cast_nullable_to_non_nullable
              as String?,
      logradouro: freezed == logradouro
          ? _value.logradouro
          : logradouro // ignore: cast_nullable_to_non_nullable
              as String?,
      complemento: freezed == complemento
          ? _value.complemento
          : complemento // ignore: cast_nullable_to_non_nullable
              as String?,
      numero: freezed == numero
          ? _value.numero
          : numero // ignore: cast_nullable_to_non_nullable
              as String?,
      bairro: freezed == bairro
          ? _value.bairro
          : bairro // ignore: cast_nullable_to_non_nullable
              as String?,
      localidade: freezed == localidade
          ? _value.localidade
          : localidade // ignore: cast_nullable_to_non_nullable
              as String?,
      uf: freezed == uf
          ? _value.uf
          : uf // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Endereco implements _Endereco {
  _$_Endereco(
      {this.id,
      this.cep,
      this.logradouro,
      this.complemento,
      this.numero,
      this.bairro,
      this.localidade,
      this.uf});

  factory _$_Endereco.fromJson(Map<String, dynamic> json) =>
      _$$_EnderecoFromJson(json);

  @override
  final String? id;
  @override
  final String? cep;
  @override
  final String? logradouro;
  @override
  final String? complemento;
  @override
  final String? numero;
  @override
  final String? bairro;
  @override
  final String? localidade;
  @override
  final String? uf;

  @override
  String toString() {
    return 'Endereco(id: $id, cep: $cep, logradouro: $logradouro, complemento: $complemento, numero: $numero, bairro: $bairro, localidade: $localidade, uf: $uf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Endereco &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cep, cep) || other.cep == cep) &&
            (identical(other.logradouro, logradouro) ||
                other.logradouro == logradouro) &&
            (identical(other.complemento, complemento) ||
                other.complemento == complemento) &&
            (identical(other.numero, numero) || other.numero == numero) &&
            (identical(other.bairro, bairro) || other.bairro == bairro) &&
            (identical(other.localidade, localidade) ||
                other.localidade == localidade) &&
            (identical(other.uf, uf) || other.uf == uf));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cep, logradouro, complemento,
      numero, bairro, localidade, uf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnderecoCopyWith<_$_Endereco> get copyWith =>
      __$$_EnderecoCopyWithImpl<_$_Endereco>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnderecoToJson(
      this,
    );
  }
}

abstract class _Endereco implements Endereco {
  factory _Endereco(
      {final String? id,
      final String? cep,
      final String? logradouro,
      final String? complemento,
      final String? numero,
      final String? bairro,
      final String? localidade,
      final String? uf}) = _$_Endereco;

  factory _Endereco.fromJson(Map<String, dynamic> json) = _$_Endereco.fromJson;

  @override
  String? get id;
  @override
  String? get cep;
  @override
  String? get logradouro;
  @override
  String? get complemento;
  @override
  String? get numero;
  @override
  String? get bairro;
  @override
  String? get localidade;
  @override
  String? get uf;
  @override
  @JsonKey(ignore: true)
  _$$_EnderecoCopyWith<_$_Endereco> get copyWith =>
      throw _privateConstructorUsedError;
}

Situacao _$SituacaoFromJson(Map<String, dynamic> json) {
  return _Situacao.fromJson(json);
}

/// @nodoc
mixin _$Situacao {
  String get situacao => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SituacaoCopyWith<Situacao> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SituacaoCopyWith<$Res> {
  factory $SituacaoCopyWith(Situacao value, $Res Function(Situacao) then) =
      _$SituacaoCopyWithImpl<$Res, Situacao>;
  @useResult
  $Res call({String situacao});
}

/// @nodoc
class _$SituacaoCopyWithImpl<$Res, $Val extends Situacao>
    implements $SituacaoCopyWith<$Res> {
  _$SituacaoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? situacao = null,
  }) {
    return _then(_value.copyWith(
      situacao: null == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SituacaoCopyWith<$Res> implements $SituacaoCopyWith<$Res> {
  factory _$$_SituacaoCopyWith(
          _$_Situacao value, $Res Function(_$_Situacao) then) =
      __$$_SituacaoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String situacao});
}

/// @nodoc
class __$$_SituacaoCopyWithImpl<$Res>
    extends _$SituacaoCopyWithImpl<$Res, _$_Situacao>
    implements _$$_SituacaoCopyWith<$Res> {
  __$$_SituacaoCopyWithImpl(
      _$_Situacao _value, $Res Function(_$_Situacao) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? situacao = null,
  }) {
    return _then(_$_Situacao(
      situacao: null == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Situacao implements _Situacao {
  _$_Situacao({required this.situacao});

  factory _$_Situacao.fromJson(Map<String, dynamic> json) =>
      _$$_SituacaoFromJson(json);

  @override
  final String situacao;

  @override
  String toString() {
    return 'Situacao(situacao: $situacao)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Situacao &&
            (identical(other.situacao, situacao) ||
                other.situacao == situacao));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, situacao);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SituacaoCopyWith<_$_Situacao> get copyWith =>
      __$$_SituacaoCopyWithImpl<_$_Situacao>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SituacaoToJson(
      this,
    );
  }
}

abstract class _Situacao implements Situacao {
  factory _Situacao({required final String situacao}) = _$_Situacao;

  factory _Situacao.fromJson(Map<String, dynamic> json) = _$_Situacao.fromJson;

  @override
  String get situacao;
  @override
  @JsonKey(ignore: true)
  _$$_SituacaoCopyWith<_$_Situacao> get copyWith =>
      throw _privateConstructorUsedError;
}

Perfil _$PerfilFromJson(Map<String, dynamic> json) {
  return _Perfil.fromJson(json);
}

/// @nodoc
mixin _$Perfil {
  String get perfil => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerfilCopyWith<Perfil> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerfilCopyWith<$Res> {
  factory $PerfilCopyWith(Perfil value, $Res Function(Perfil) then) =
      _$PerfilCopyWithImpl<$Res, Perfil>;
  @useResult
  $Res call({String perfil});
}

/// @nodoc
class _$PerfilCopyWithImpl<$Res, $Val extends Perfil>
    implements $PerfilCopyWith<$Res> {
  _$PerfilCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perfil = null,
  }) {
    return _then(_value.copyWith(
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PerfilCopyWith<$Res> implements $PerfilCopyWith<$Res> {
  factory _$$_PerfilCopyWith(_$_Perfil value, $Res Function(_$_Perfil) then) =
      __$$_PerfilCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String perfil});
}

/// @nodoc
class __$$_PerfilCopyWithImpl<$Res>
    extends _$PerfilCopyWithImpl<$Res, _$_Perfil>
    implements _$$_PerfilCopyWith<$Res> {
  __$$_PerfilCopyWithImpl(_$_Perfil _value, $Res Function(_$_Perfil) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perfil = null,
  }) {
    return _then(_$_Perfil(
      perfil: null == perfil
          ? _value.perfil
          : perfil // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Perfil implements _Perfil {
  _$_Perfil({required this.perfil});

  factory _$_Perfil.fromJson(Map<String, dynamic> json) =>
      _$$_PerfilFromJson(json);

  @override
  final String perfil;

  @override
  String toString() {
    return 'Perfil(perfil: $perfil)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Perfil &&
            (identical(other.perfil, perfil) || other.perfil == perfil));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, perfil);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PerfilCopyWith<_$_Perfil> get copyWith =>
      __$$_PerfilCopyWithImpl<_$_Perfil>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PerfilToJson(
      this,
    );
  }
}

abstract class _Perfil implements Perfil {
  factory _Perfil({required final String perfil}) = _$_Perfil;

  factory _Perfil.fromJson(Map<String, dynamic> json) = _$_Perfil.fromJson;

  @override
  String get perfil;
  @override
  @JsonKey(ignore: true)
  _$$_PerfilCopyWith<_$_Perfil> get copyWith =>
      throw _privateConstructorUsedError;
}
