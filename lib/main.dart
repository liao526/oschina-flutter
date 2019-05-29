import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oschina/resources/style.dart';
import 'package:oschina/resources/texts.dart';
import 'package:oschina/widget/main_home_widget.dart';

import 'module/launch/launch.dart';

void main() {
  debugPaintSizeEnabled = false;

  runApp(MyApp());
//  if (Platform.isAndroid) {
//    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，
//    // 是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle =
//        SystemUiOverlayStyle(statusBarColor: ThemeColors.MAIN_COLOR);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{"/HomePage": (context) => HomeWidget()},
      title: StringText.APP_TITLE,
      theme: getDefThemeData(),
      home: LaunchWidget(),
    );
  }
}
