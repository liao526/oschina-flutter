import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oschina/resources/style.dart';
import 'package:oschina/resources/texts.dart';
import 'package:oschina/widget/home_widget.dart';


void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringText.APP_TITLE,
      theme: getDefThemeData(),
      home: HomeWidget(),
    );
  }
}

