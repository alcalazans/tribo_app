import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tribo/app/shared/auth/auth_controller.dart';

class SplashPage extends StatefulWidget {

  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {

    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2)
    );

    animation = Tween<double>(begin: 0.0, end: 2.0).animate(animationController);
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed) {

        final auth = Modular.get<AuthController>();

        Future.delayed(Duration(seconds: 3)).then((v) {
          if(auth.status== AuthStatus.login) {
            Modular.to.pushReplacementNamed('/home');
          }else{
            Modular.to.pushReplacementNamed('/login');
          }
        });
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(Animation<double> animation) : super(listenable: animation);
  double _valor = 0.0;
  @override
  Widget build(BuildContext context){
    final Animation<double> animation = listenable;
    print(animation.value);
    if(animation.value!= null)
      _valor = animation.value;
    if(animation.value > 1.0)
      _valor = 1.0;
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Opacity( opacity: _valor ,
          child: Center(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon( FontAwesomeIcons.handshake, color: Colors.white, size: 150,),
                  Center(
                      child: Text('TRIBO', style: TextStyle(fontSize:19 ,color: Colors.white, fontWeight: FontWeight.bold) )
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
