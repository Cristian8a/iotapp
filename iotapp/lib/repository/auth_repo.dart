import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class AuthUser extends Equatable {
  final String uid;
  final String? email;

  AuthUser({required this.uid, this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];
}

abstract class AuthRepoBase {
  Stream<AuthUser> get onAuthStateChanged;

  Future<AuthUser> signInAnonymusly(String email, String password);

  Future<AuthUser> signInWithGoogle();

  Future<void> logout();
}
