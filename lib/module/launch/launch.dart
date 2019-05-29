import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final String launchBG = "assets/images/common/app_launch_bg.png";
final String launchLogo = "assets/images/common/app_launch_logo.png";

class LaunchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LaunchWidgetState();
  }
}

class LaunchWidgetState extends State<LaunchWidget> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white70));
    _timer = Timer(Duration(milliseconds: 3000),_callback);
  }

  void _callback() {
    print("timer call back");
    Navigator.of(context).pushNamed("/HomePage");
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset(launchBG).image,fit: BoxFit.fill),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(padding: EdgeInsets.only(top: 200),child: Image.asset(launchLogo,width: 200,),),
      ),
    );
  }
}
