import 'package:tribo/app/modules/user/model/user_model.dart';

abstract class IUserRepository {
  Stream<UserModel> getUser();
  Stream<List<Address>> getAddress();
  Stream<List<Notify>> getNotify();
  Stream<List<Contract>> getContract();
  Future<UserModel> saveUser();
}