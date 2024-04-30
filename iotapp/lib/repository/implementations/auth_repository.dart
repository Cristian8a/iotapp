import 'package:firebase_auth/firebase_auth.dart';
import 'package:iotapp/repository/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo extends AuthRepoBase {
  final _firebase = FirebaseAuth.instance;

  AuthUser? _userFromFirebase(User? user) =>
      user == null ? null : AuthUser(uid: user.uid, email: user.email);

  @override
  Stream<AuthUser> get onAuthStateChanged =>
      _firebase.authStateChanges().asyncMap((user) => _userFromFirebase(user)!);

  @override
  Future<AuthUser> signInAnonymusly(String username, String password) async {
    final user = await _firebase.signInAnonymously();
    return _userFromFirebase(user.user)!;
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await _firebase.signOut();
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return _userFromFirebase(authResult.user)!;
  }
}
