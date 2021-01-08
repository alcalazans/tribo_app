// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  ObservableStream<UserModel> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableStream<UserModel> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$addressAtom = Atom(name: '_UserControllerBase.address');

  @override
  ObservableStream<List<Address>> get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(ObservableStream<List<Address>> value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$contractAtom = Atom(name: '_UserControllerBase.contract');

  @override
  ObservableStream<List<Contract>> get contract {
    _$contractAtom.reportRead();
    return super.contract;
  }

  @override
  set contract(ObservableStream<List<Contract>> value) {
    _$contractAtom.reportWrite(value, super.contract, () {
      super.contract = value;
    });
  }

  final _$notifyAtom = Atom(name: '_UserControllerBase.notify');

  @override
  ObservableStream<List<Notify>> get notify {
    _$notifyAtom.reportRead();
    return super.notify;
  }

  @override
  set notify(ObservableStream<List<Notify>> value) {
    _$notifyAtom.reportWrite(value, super.notify, () {
      super.notify = value;
    });
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  dynamic getUser() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.getUser');
    try {
      return super.getUser();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getAdress() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.getAdress');
    try {
      return super.getAdress();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNotify() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.getNotify');
    try {
      return super.getNotify();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getContract() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.getContract');
    try {
      return super.getContract();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
address: ${address},
contract: ${contract},
notify: ${notify}
    ''';
  }
}
