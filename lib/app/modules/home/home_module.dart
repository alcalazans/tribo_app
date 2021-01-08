import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/modules/home/home_controller.dart';
import 'package:tribo/app/modules/home/home_page.dart';
import 'package:tribo/app/modules/search/search_controller.dart';
import 'package:tribo/app/modules/user/repositories/user_repository.dart';
import 'package:tribo/app/modules/user/repositories/user_repository_interface.dart';
import 'package:tribo/app/modules/user/user_controller.dart';
import 'package:tribo/app/shared/auth/auth_controller.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => SearchController()),
        Bind((i) => UserController(i.get())),
        Bind((i) => AuthController()),
        Bind<IUserRepository>((i) => UserRepository(Firestore.instance, i.get()))
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
