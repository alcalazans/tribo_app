import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/shared/auth/repositories/auth_repository.dart';
import 'package:tribo/app/shared/auth/repositories/auth_repository_interface.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store{

  final IAuthRepository _authRepository = Modular.get<AuthRepository>();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  FirebaseUser user;

  _AuthControllerBase(){
    print("chamei o construtor _AuthControllerBase");
    _authRepository.getUser().then((value){
      setUser(value);
    });
  }

  @action
  setUser(FirebaseUser value){
    user = value;
    print("usuario: " + user.toString());
    status = user!=null ? AuthStatus.login : AuthStatus.logoff;
    print("setei o status " + status.toString());
  }

  Future loginEmailSenha(email, senha) async{
    user = await _authRepository.getEmailLogin(email, senha);
  }

  Future logout() async{
     await _authRepository.logout();
     Modular.to.pushReplacementNamed('/login');
     status = AuthStatus.logoff;
  }

}

enum AuthStatus{
  loading, login, logoff
}