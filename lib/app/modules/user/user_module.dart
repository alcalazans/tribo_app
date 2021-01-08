import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tribo/app/modules/home/home_controller.dart';
import 'package:tribo/app/modules/user/repositories/user_repository.dart';
import 'package:tribo/app/modules/user/repositories/user_repository_interface.dart';
import 'package:tribo/app/modules/user/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/modules/user/user_page.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => UserController(i.get())),
    Bind<IUserRepository>((i) => UserRepository(Firestore.instance, i.get())),
    Bind((i) => HomeController())
  ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => UserPage()),
      ];

  static Inject get to => Inject<UserModule>.of();
}
