import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tribo/app/modules/user/model/user_model.dart';
import 'user_controller.dart';

class UserPage extends StatefulWidget {
  final String title;
  const UserPage({Key key, this.title = "User"}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends ModularState<UserPage, UserController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      //backgroundColor: Colors.cyanAccent,
      body: Container(
        child: Observer(builder: (_){
            var user = controller.user.data;
            List<Address> addressList = controller.address.data;
            List<Contract> contractList = controller.contract.data;
            List<Notify> notifyList = controller.notify.data;
            if(user==null || addressList==null || contractList==null || notifyList==null) {
              return CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: "https://avatars3.githubusercontent.com/u/11741676?s=460&u=c39d5940b9a92183a05f8a18bdcf4e510ab9ea66&v=4",
                              placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                              errorWidget: (context, url, error) => new Icon(Icons.error),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text( user.name.toString().length > 36 ? user.name.toString().substring(0, 36) + " ..." : user.name, softWrap: false, style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Text(user.email, style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black87,
                              ),),
                            ),
                          ],
                        ),
                    ]),
                    SizedBox(height: 15,),
                    const Divider(
                      color: Colors.black12,
                      height: 10,
                      thickness: 1,
                      indent: 1,
                      endIndent: 0,
                    ),
                    Text("Meus Contratos:", style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),),
                    SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: contractList.length,
                        itemBuilder: (_, index){
                          Contract model = contractList[index];
                          return GestureDetector(
                            child: Card(
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl: model.workerImg,
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
                                          Container(
                                            padding: const EdgeInsets.all(1.0),
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.7,
                                            child: Text(model.serviceId, softWrap: true, style:
                                                TextStyle(
                                                fontSize: 14.0, fontWeight: FontWeight.bold
                                                ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(1.0),
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.7,
                                            child: Text(model.worker,
                                              softWrap: true, style: TextStyle(fontSize: 14.0), ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(1.0),
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width * 0.7,
                                            child: Text("Última atualização: " + model.dataUltimaModificao,
                                              softWrap: true, style: TextStyle(fontSize: 14.0), ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  padding: const EdgeInsets.all(1.0),
                                                  width: 46,
                                                  child: Text("Status: ", softWrap: true, style: TextStyle(fontSize: 14.0,), ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(0.1),
                                                  width: MediaQuery.of(context).size.width * 0.39,
                                                  child: Text(" "+ model.status + " ", softWrap: true, style: TextStyle(fontSize: 15.0, color: model.status=="concluído" ?  Colors.green : Colors.redAccent
                                                    ), ),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              //sendParameterToCallBack(context, snap);
                            },
                          );
                        },
                      )
                    ),
                  SizedBox(height: 10,),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

}
