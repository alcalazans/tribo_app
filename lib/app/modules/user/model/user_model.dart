import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tribo/app/shared/utils/date_util.dart';

class UserModel {

  String email;
  String name;
  String uid;
  String phone;
  String whatsapp;
  String newnotify;
  List<Address> address;
  List<Contract> contract;
  List<Notify> notify;

  UserModel(
      {this.email,
        this.name,
        this.uid,
        this.phone,
        this.whatsapp,
        this.newnotify,
        this.address,
        this.contract,
        this.notify});

  factory UserModel.fromDocument(DocumentSnapshot doc) {

    List<Address> address;
    if (doc['address'] != null) {
      doc['address'].forEach((v) {
        address.add(new Address.fromDoc(v));
      });
    }

    List<Contract> contract;
    if (doc['contract'] != null) {
      doc['contract'].forEach((v) {
        contract.add(new Contract.fromDoc(v));
      });
    }

    List<Notify> notify;
    if (doc['notify'] != null) {
      doc['notify'].forEach((v) {
        notify.add(new Notify.fromDoc(v));
      });
    }

    return UserModel(email: doc['email'], name: doc['name'],
      uid: doc['uid'], phone: doc['phone'], whatsapp: doc['whatsapp'], newnotify: doc['newnotify'],
        address: address, contract: contract,notify: notify
    );
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    uid = json['uid'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    newnotify = json['newnotify'];
    if (json['address'] != null) {
      address = new List<Address>();
      json['address'].forEach((v) {
        address.add(new Address.fromJson(v));
      });
    }
    if (json['contract'] != null) {
      contract = new List<Contract>();
      json['contract'].forEach((v) {
        contract.add(new Contract.fromJson(v));
      });
    }
    if (json['notify'] != null) {
      notify = new List<Notify>();
      json['notify'].forEach((v) {
        notify.add(new Notify.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['uid'] = this.uid;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    data['newnotify'] = this.newnotify;
    if (this.address != null) {
      data['address'] = this.address.map((v) => v.toJson()).toList();
    }
    if (this.contract != null) {
      data['contract'] = this.contract.map((v) => v.toJson()).toList();
    }
    if (this.notify != null) {
      data['notify'] = this.notify.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String bairro;
  String cep;
  String cidade;
  String complemento;
  String estado;
  String latlong;
  String logradouro;
  String id;

  Address(
      {this.bairro,
        this.cep,
        this.cidade,
        this.complemento,
        this.estado,
        this.latlong,
        this.logradouro,
        this.id});

  Address.fromDoc(DocumentSnapshot doc) {
    bairro = doc['bairro'];
    cep = doc['cep'];
    cidade = doc['cidade'];
    complemento = doc['complemento'];
    estado = doc['estado'];
    latlong = doc['latlong'];
    logradouro = doc['logradouro'];
    id = doc['id'];
  }

  Address.fromJson(Map<String, dynamic> json) {
    bairro = json['bairro'];
    cep = json['cep'];
    cidade = json['cidade'];
    complemento = json['complemento'];
    estado = json['estado'];
    latlong = json['latlong'];
    logradouro = json['logradouro'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bairro'] = this.bairro;
    data['cep'] = this.cep;
    data['cidade'] = this.cidade;
    data['complemento'] = this.complemento;
    data['estado'] = this.estado;
    data['latlong'] = this.latlong;
    data['logradouro'] = this.logradouro;
    data['id'] = this.id;
    return data;
  }
}

class Contract {
  String adress;
  String client;
  String id;
  String score;
  String serviceId;
  String status;
  String worker;
  Timestamp createDate;
  Timestamp lastUpdate;
  String dataCriacao;
  String dataUltimaModificao;
  String workerImg;

  Contract(
      {this.adress,
        this.client,
        this.id,
        this.score,
        this.serviceId,
        this.status,
        this.worker,
        this.createDate,
        this.lastUpdate,
        this.workerImg
      });

  Contract.fromDoc(DocumentSnapshot doc) {
    adress = doc['adress'];
    client = doc['client'];
    id = doc['id'];
    score = doc['score'];
    serviceId = doc['serviceId'];
    status = doc['status'];
    worker = doc['worker'];
    createDate = doc['createDate'];
    lastUpdate= doc['lastUpdate'];
    dataCriacao = DataUtil.formatTimestamp(createDate);
    dataUltimaModificao = DataUtil.formatTimestamp(lastUpdate);
    workerImg = doc['workerImg'];
  }

  Contract.fromJson(DocumentSnapshot json) {
    adress = json['adress'];
    client = json['client'];
    id = json['id'];
    score = json['score'];
    serviceId = json['serviceId'];
    status = json['status'];
    worker = json['worker'];
    createDate = json['createDate'];
    lastUpdate= json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adress'] = this.adress;
    data['client'] = this.client;
    data['id'] = this.id;
    data['score'] = this.score;
    data['serviceId'] = this.serviceId;
    data['status'] = this.status;
    data['worker'] = this.worker;
    data['createDate'] = this.createDate;
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}

class Notify {
  String contract;
  String id;
  String idmessage;
  String status;

  Notify({this.contract, this.id, this.idmessage, this.status});

  Notify.fromDoc(DocumentSnapshot doc) {
    contract = doc['contract'];
    id = doc['id'];
    idmessage = doc['idmessage'];
    status = doc['status'];
  }

  Notify.fromJson(Map<String, dynamic> json) {
    contract = json['contract'];
    id = json['id'];
    idmessage = json['idmessage'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contract'] = this.contract;
    data['id'] = this.id;
    data['idmessage'] = this.idmessage;
    data['status'] = this.status;
    return data;
  }


}