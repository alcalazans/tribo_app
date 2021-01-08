import 'package:cloud_firestore/cloud_firestore.dart';

class ContractModel{

  final String serviceId;
  final String descricaoServico;
  final String textoInicial;

  final String adress;
  final String client;
  final Timestamp createDate;// 1 de março de 2020 09:02:00 UTC-3
  final String id;
  final Timestamp lastUpdate;// 1 de março de 2020 09:02:00 UTC-3
  final String score;
  final String status;
  final String worker;
  final String workerImg;
  final List<String> messages;

  ContractModel({this.serviceId, this.descricaoServico, this.textoInicial,
    this.adress, this.client, this.createDate, this.id, this.lastUpdate, this.score,
    this.status, this.worker, this.workerImg, this.messages});

}