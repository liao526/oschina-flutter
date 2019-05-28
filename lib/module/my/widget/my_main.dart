import 'package:flutter/material.dart';
import 'package:oschina/module/my/data/my_data.dart';
import 'package:oschina/resources/colors.dart';
import 'package:toast/toast.dart';

class MyMainWidget extends StatelessWidget {
  final List<MyMainItem> mainItemData;

  MyMainWidget() : mainItemData = reqMainItemData();

  Widget _buildListTitle(MainOtherItem item,GestureTapCallback function) {
    return ListTile(
      onTap:function,
      leading: Icon(item.icon),
      title: Text(
        item.title,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        size: 14,
      ),
    );
  }

  List<Widget> _buildInfoChildren(MainHeadItem otherInfo) {
    List<Widget> childWidgetList = List();
    otherInfo.itemMap.forEach((key,value) {
      childWidgetList.add(Expanded(
          child: Column(
            children: <Widget>[
              Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                key,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          )));
    });
    return childWidgetList;
  }

  Widget _buildHead(MainHeadItem info) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          color: ThemeColors.MAIN_COLOR,
        ),
        Divider(height: 0.3,color: Colors.white,),

        Container(
          padding: EdgeInsets.only(top: 10,bottom: 10),
          color: ThemeColors.MAIN_COLOR,
          child: Row(
            children: _buildInfoChildren(info),
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            MyMainItem item = mainItemData[index];
            switch (item.getType()) {
              case Type.headItem:
                return _buildHead(item);
              case Type.otherItem:
                return _buildListTitle(item,()=>{
                  Toast.show("index = $index", context)
                });
            }
          },
          separatorBuilder: (context, index) =>
              Divider(
                height: 0.3,
                color: Colors.grey,
              ),
          itemCount: mainItemData.length),
    );
  }
}
