import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tribo/app/shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  AuthController auth = Modular.get();
  String _email;
  String _senha;

  @observable
  bool loading = false;

  @action
  Future login() async {
    try{
      loading = true;
      await auth.loginEmailSenha(_email, _senha).then((value) => Modular.to.pushReplacementNamed('/home'));
    }catch(e){
      loading = false;
    }
  }

  void setEmail(value){
    _email = value;
  }

  void setSenha(value){
    _senha = value;
  }
}
