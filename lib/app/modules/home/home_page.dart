import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:tribo/app/modules/search/search_page.dart';
import 'package:tribo/app/modules/user/user_controller.dart';
import 'package:tribo/app/modules/user/user_page.dart';
import 'package:tribo/app/shared/auth/auth_controller.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {

    final userStore = Modular.get<UserController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Column(
        children: <Widget>[
          Icon( FontAwesomeIcons.handshake, color: Colors.white, size: 25,),
          Container(
              child: Text('  SERPRO', style: TextStyle(fontSize:13 ,color: Colors.white, fontWeight: FontWeight.bold) )
          ),
        ],
      ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 30,
              height: 30,
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 5),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffc32c37),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Observer(builder: (_){
                        var notificacoes = "0";
                        if(userStore.user != null){
                          var user = userStore.user.data;
                          notificacoes = user != null ? user.newnotify.toString() : "0";
                        }
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Text(notificacoes,
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          //IconButton(icon: Icon(Icons.add_alert), color: Colors.white, onPressed: (){}, enableFeedback: true),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.blue,
            primaryColor: Colors.white,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.white38))),
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _page,
            onTap: (p) {
              _pageController.animateToPage(p,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Principal")),
              BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Buscar")),
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.handshake), title: Text("Contratos")),
            ]),
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          children: <Widget>[
              UserPage(),
              SearchPage(),
              UserPage()
          ],
        ),
      ),
    );
  }
}
