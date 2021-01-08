import 'package:tribo/app/modules/contrato/contrato_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/modules/contrato/contrato_page.dart';

//https://www.youtube.com/watch?v=xUNYglMLOj0&t=1164s passando parametros 11:13
class ContratoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ContratoController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ContratoPage(contractModel: args.data,)),
      ];

  static Inject get to => Inject<ContratoModule>.of();
}
