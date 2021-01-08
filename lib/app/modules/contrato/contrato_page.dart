import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/shared/model/contract_model.dart';
import 'package:tribo/app/shared/widgets/input_field.dart';

import 'contrato_controller.dart';

class ContratoPage extends StatefulWidget {
  final ContractModel contractModel;
  final String title;

  const ContratoPage(
      {Key key, this.title = "Contrato", @required this.contractModel})
      : super(key: key);

  @override
  _ContratoPageState createState() => _ContratoPageState();
}

class _ContratoPageState
    extends ModularState<ContratoPage, ContratoController> {

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Entrar em Contato",
            style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.normal)),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                height: 170,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext ctx, int index) {
                    return _contactCard(context, index, widget.contractModel);
                  },
                )),
            Expanded(
              child: Container(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Form(
                      child: ListView(
                          padding: EdgeInsets.fromLTRB(12.0, 1.0, 16.0, 40.0),
                          children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InputField(
                              hint: "Enviar mensagem",
                              obscure: false,
                              //stream: _contactSevice.outMessages,
                              //onChanged: _contactSevice.setMessages,
                              tipoTeclado: TextInputType.text,
                              colorParam: Colors.black54,
                              maxLines: 999,
                              maxLength: 250,
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            SizedBox(
                              height: 44.0,
                              child: StreamBuilder<bool>(
                                  //stream: _contactSevice.outSubmitValid,
                                  builder: (context, snapshot) {
                                    return RaisedButton(
                                      child: Text(
                                        "Enviar",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.green,
                                      disabledColor: Colors.grey.withAlpha(100),
//                                      onPressed: snapshot.hasData
//                                          ? _contactSevice.submitNewContract
//                                          : null,
                                    );
                                  }),
                            ),
                          ],
                        )
                      ])),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _contactCard(BuildContext context, int index, ContractModel contractModel) {
  return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: contractModel.workerImg,
                  placeholder: (context, url) =>
                  new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    contractModel.worker ?? "",
                    style: TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(contractModel.descricaoServico,
                        softWrap: true, style: TextStyle(fontSize: 14.0)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
}