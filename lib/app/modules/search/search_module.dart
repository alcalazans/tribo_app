import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/modules/search/search_controller.dart';
import 'package:tribo/app/modules/search/search_page.dart';

class SearchModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SearchController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SearchPage()),
      ];

  static Inject get to => Inject<SearchModule>.of();
}
