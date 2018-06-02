import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      controller=new AnimationController(
        duration: const Duration(milliseconds: 2000), 
        vsync: this);
        //presence of vsync argument prevents offscreen animations from consuming unnecessary resources

        //following code generates double value 0.0 to 300.0 over the course of 300 ms
      animation=new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener((){
        setState(() {
                  //the  state that has changed is the animation object's value
                });
      });
      controller.forward();

    }
//Dispose of the controller when the animation is finished to prevent memory leaks.
    @override
      void dispose() {
        controller.dispose();
        super.dispose();
      }
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: reweyouLogo(),
                      ),
                    );
                  }
        
        Image reweyouLogo() {
          return new Image(
                //add your asset in pubspec.yaml to actually show the image
                image: new AssetImage('assets/images/logo.png'),
              
          );
        }
        
}