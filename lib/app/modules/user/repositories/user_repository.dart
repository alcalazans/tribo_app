import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tribo/app/modules/user/model/user_model.dart';
import 'package:tribo/app/modules/user/repositories/user_repository_interface.dart';
import 'package:tribo/app/shared/auth/auth_controller.dart';

class UserRepository implements IUserRepository {
  final Firestore firestore;
  FirebaseUser currentUser;
  final AuthController authController;

  UserRepository(this.firestore, this.authController){
    this.currentUser = authController.user;
  }

  @override
  Future<UserModel> saveUser() {
    // T  ODO: implement saveUser
    throw UnimplementedError();
  }

  @override
  Stream<UserModel> getUser() {
    return firestore.collection("users").document(currentUser.uid).snapshots().map((doc) {
      return UserModel.fromDocument(doc);
    });
  }

  @override
  Stream<List<Address>> getAddress() {
    return firestore.collection("users").document(currentUser.uid).collection('address').snapshots().map((docs) {
      return docs.documents.map((doc) {
        return Address.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Stream<List<Contract>> getContract() {
    return firestore.collection("users").document(currentUser.uid).collection("contract")
        .orderBy("lastUpdate", descending: true).snapshots().map((docs) {
      return docs.documents.map((doc) {
        return Contract.fromDoc(doc);
      }).toList();
    });
  }

  @override
  Stream<List<Notify>> getNotify() {
    return firestore.collection("users").document(currentUser.uid).collection('notify').snapshots().map((docs) {
      return docs.documents.map((doc) {
        return Notify.fromDoc(doc);
      }).toList();
    });
  }

}
