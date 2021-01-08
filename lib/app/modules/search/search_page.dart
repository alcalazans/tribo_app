import 'package:algolia/algolia.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/shared/model/contract_model.dart';

import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  final String title;

  const SearchPage({Key key, this.title = "Search"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
//      appBar: AppBar(
//        title: Text("Buscar Profissional",
//            style: TextStyle(
//                fontSize: 17,
//                color: Colors.white,
//                fontWeight: FontWeight.normal)),
//        backgroundColor: Colors.blue,
//        centerTitle: true,
//        actions: <Widget>[],
//      ),
      //backgroundColor: Colors.black,
      body: Center(
        child: Observer(builder: (_) {
          var resultados = controller.results;
          return Column(children: <Widget>[
            Container(
              //backgroundColor: Color.fromRGBO(242, 242, 242, 0.5),
              //color: Colors.white,
              color: Color.fromRGBO(242, 242, 242, 1),
              height: 69,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                //padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onSubmitted: (context) {
                        if (!context.toString().isEmpty) {
                          controller.onChangedSearch(context);
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        hintText: "Que serviço você precisa?",
                        hintStyle: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.normal),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        contentPadding: EdgeInsets.only(
                            left: 1, right: 30, bottom: 5, top: 5),
                        errorText: null,
                      ),
                      style: TextStyle(color: Colors.blue),
                      obscureText: false,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      child: Observer(builder: (_) {
                        if (resultados != null && resultados.length > 0) {
                          return Container(
                              child: ListView.builder(
                            itemCount: resultados.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              AlgoliaObjectSnapshot snap = resultados[index];
                              return _contactCard(context, index, snap);
                            },
                          ));
                        } else {
                          if (controller.searchStatus == ServiceStatus.LOAD) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Colors.blue),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }
                      }))),
            ),
          ]);
        }),
      ),
    );
  }
}

Widget _contactCard(BuildContext context, int index, AlgoliaObjectSnapshot snap) {
  return GestureDetector(
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: snap.data["img"],
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
                    snap.data["nome"] ?? "",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(1.0),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(snap.data["descricao"],
                        softWrap: true, style: TextStyle(fontSize: 14.0)),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Atendimentos realizados: " +
                            snap.data["atendimentos"].toString() ??
                        "",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  Text(
                    "Clientes satisfeitos: " + snap.data["rating"] + "0%" ?? "",
                    style: TextStyle(fontSize: 14.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
    onTap: () {
      print("clicou");
      Modular.to.pushNamed("/contrato", arguments: ContractModel(
        serviceId: snap.objectID,
        adress: "",
        client: "",
        createDate: null,
        descricaoServico: snap.data["descricao"],
        id: null,
        lastUpdate: null,
        messages: [],
        score: "",
        status: "",
        textoInicial: "",
        worker: snap.data["nome"],
        workerImg: snap.data["img"]
      ));
    },
  );
}
