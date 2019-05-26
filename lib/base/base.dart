import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: initAppBar(),
      body: initBody(),
    );
  }

  Widget initAppBar() {
    return null;
  }

  Widget initBody();
  
}