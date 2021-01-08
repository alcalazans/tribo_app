import 'package:mobx/mobx.dart';
import 'package:tribo/app/modules/user/model/user_model.dart';
import 'package:tribo/app/modules/user/repositories/user_repository_interface.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {

  final IUserRepository repository;

  _UserControllerBase(this.repository){
    getUser();
    getNotify();
    getAdress();
    getContract();
  }

  @observable
  ObservableStream<UserModel> user;

  @observable
  ObservableStream<List<Address>> address;

  @observable
  ObservableStream<List<Contract>> contract;

  @observable
  ObservableStream<List<Notify>> notify;

  @action
  getUser(){
    user = repository.getUser().asObservable();
  }

  @action
  getAdress(){
    address = repository.getAddress().asObservable();
  }

  @action
  getNotify(){
    notify = repository.getNotify().asObservable();
  }

  @action
  getContract(){
    contract = repository.getContract().asObservable();
  }
}
