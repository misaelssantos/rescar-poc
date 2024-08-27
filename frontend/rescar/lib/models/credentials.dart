// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials.freezed.dart';
part 'credentials.g.dart';

@freezed
class Credentials with _$Credentials {
  factory Credentials({required String email, required String senha}) = _Credentials;
  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);
}

// {
//   "nome": "Administrador Teste",
//   "id": "d0ff4b09-b179-4a54-a3b1-dc6090aface2",
//   "exp": 1695126943,
//   "iat": 1695040543,
//   "email": "administrador@hotmail.com",
//   "perfil": "A"
// }
@freezed
class InfoUsuario with _$InfoUsuario {
  const InfoUsuario._();
  factory InfoUsuario(
      {required String nome,
      required String id,
      required double exp,
      required double iat,
      required String email,
      required String perfil,
      required String jwt}) = _InfoUsuario;
  factory InfoUsuario.fromJson(Map<String, dynamic> json) => _$InfoUsuarioFromJson(json);
}