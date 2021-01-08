import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthRepository {

  Future<FirebaseUser> getUser();
  Future getGoogleLogin();
  Future<FirebaseUser> getEmailLogin(String email, String senha);
  Future<String> getToken();
  Future logout();

}