import 'package:flutter/material.dart';

enum Type { headItem, otherItem }

abstract class MyMainItem {
  Type getType();
}

class MainHeadItem extends MyMainItem {
  final Map<String, String> itemMap;

  MainHeadItem()
      : itemMap = <String, String>{"动弹": "0", "收藏": "0", "关注": "0", "粉丝": "0"};

  @override
  Type getType() {
    return Type.headItem;
  }
}

class MainOtherItem extends MyMainItem {
  IconData icon;
  String title;

  MainOtherItem(this.icon, this.title);

  @override
  Type getType() {
    return Type.otherItem;
  }
}

List<MyMainItem> reqMainItemData() {
  List<MyMainItem> items = [
    MainHeadItem(),
    MainOtherItem(Icons.message, "我的消息"),
    MainOtherItem(Icons.bookmark, "阅读记录"),
    MainOtherItem(Icons.http, "我的博客"),
    MainOtherItem(Icons.directions_bike, "阅读记录"),
    MainOtherItem(Icons.airplanemode_active, "我的活动"),
    MainOtherItem(Icons.flag, "关注标签"),
  ];
  return items;
}

//class MyMainItemData {
//  final List<MyMainItem> itemList;
//
//  int getItemCount() {
//    return (itemList == null || itemList.isEmpty) ? 0 : itemList.length;
//  }
//
//  MyMainItemData()
//      : itemList = [
//          MainHeadItem(),
//          MainOtherItem(Icons.message, "我的消息"),
//          MainOtherItem(Icons.bookmark, "阅读记录"),
//          MainOtherItem(Icons.http, "我的博客"),
//          MainOtherItem(Icons.directions_bike, "阅读记录"),
//          MainOtherItem(Icons.airplanemode_active, "我的活动"),
//          MainOtherItem(Icons.flag, "关注标签"),
//        ];
//}
