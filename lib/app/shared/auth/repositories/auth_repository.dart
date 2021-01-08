import 'package:firebase_auth/firebase_auth.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getEmailLogin(email, senha) async {
    await _auth.signInWithEmailAndPassword(email: email, password: senha)
    .catchError((e) {
    });

    return _auth.currentUser();
  }

  @override
  Future getGoogleLogin() {
    // TODO: implement getGoogleLogin
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getUser() {
    return FirebaseAuth.instance.currentUser();
  }

  @override
  Future logout() async {
    await _auth.signOut();
  }


}