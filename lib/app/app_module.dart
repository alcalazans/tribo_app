import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/app_controller.dart';
import 'package:tribo/app/app_widget.dart';
import 'package:tribo/app/modules/contrato/contrato_module.dart';
import 'package:tribo/app/modules/home/home_module.dart';
import 'package:tribo/app/modules/login/login_module.dart';
import 'package:tribo/app/modules/user/user_module.dart';
import 'package:tribo/app/pages/splash/splash_controller.dart';
import 'package:tribo/app/pages/splash/splash_page.dart';
import 'package:tribo/app/shared/auth/auth_controller.dart';
import 'package:tribo/app/shared/auth/repositories/auth_repository.dart';
import 'package:tribo/app/shared/auth/repositories/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_,args) => SplashPage()),
        Router('/login', module: LoginModule(), transition: TransitionType.noTransition),
        Router('/home', module: HomeModule()),
        Router('/user', module: UserModule()),
        Router('/contrato', module: ContratoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
