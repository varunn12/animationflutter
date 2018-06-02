import 'package:flutter/material.dart';



//The AnimatedWidget class allows you to separate out
// the widget code from the animation code in the setState() call.
// AnimatedWidget doesn’t need to maintain a State object to hold the animation.
//Replacing Statefulwidget with AnimatedWIdget

class AnimatedLogo extends AnimatedWidget{
  // The Tweens are static because they don't change.
  static final _opacityTween = new Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 300.0);

  AnimatedLogo({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    
    
    final Animation<double> animation=listenable;
    return new Center(
      child: new Opacity(
        opacity: _opacityTween.evaluate(animation),
              child: new Container(
          margin: new EdgeInsets.symmetric(vertical: 10.0),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: reweyouLogo(),
        ),
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

class TweenLogoApp extends StatefulWidget {
  @override
  _TweenLogoAppState createState() => new _TweenLogoAppState();
}

class _TweenLogoAppState extends State<TweenLogoApp> with SingleTickerProviderStateMixin{
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
      // animation=new Tween(begin: 0.0, end: 300.0).animate(controller)
      animation=new CurvedAnimation(
        parent: controller, curve: Curves.easeIn
      );
      animation.addStatusListener((status){
        if(status==AnimationStatus.completed){
          controller.reverse();
        }
        else if(status==AnimationStatus.dismissed){
          controller.forward();
        }
      }); //to get notifications about the state
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
    return new AnimatedLogo(animation: animation);
  }
}