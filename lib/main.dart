import 'package:flutter/material.dart';

import 'infiniteanimation.dart';
import 'simple.dart';
import 'simplewidget.dart';
import 'usinganimatedbuilder.dart';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(primaryColor: Colors.blue),
      home: HomeApp(),
    ));

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => new _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Animation'),
      ),
      body: new Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                  children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(16.0),
                  child: new RaisedButton(
            onPressed: () {
              Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new LogoApp()));
            },
            child: Text('Simple Animation'),
          ),
        ),
        new Padding(
          padding: new EdgeInsets.all(16.0),
                  child: new RaisedButton(
            child: new Text('Using Animted Widget'),
            onPressed: () {
              Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new WidgetLogoApp()));
            },
          ),
        ),
         new Padding(
          padding: new EdgeInsets.all(16.0),
                  child: new RaisedButton(
            child: new Text('Nonstop Animation'),
            onPressed: () {
              Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new InfiniteLogoApp()));
            },
          ),
        ),
        new Padding(
          padding: new EdgeInsets.all(16.0),
                  child: new RaisedButton(
            child: new Text('Animated Builder Animation'),
            onPressed: () {
              Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new LogoBuilderApp()));
            },
          ),
        )
                  ],
                ),
            ],
          ),
      ),
    );
  }
}
