import 'package:mobx/mobx.dart';

part 'contrato_controller.g.dart';

class ContratoController = _ContratoControllerBase with _$ContratoController;

abstract class _ContratoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
