import 'package:flutter/material.dart';
import 'package:oschina/model/nav_data.dart' show NavigationBarModel;

class FabBottomAppBar extends StatefulWidget {
  final List<NavigationBarModel> navTabItems;
  final ValueChanged<int> onNavTabSelected;

  FabBottomAppBar(this.navTabItems, {this.onNavTabSelected})
      : assert(navTabItems != null);

  @override
  State<StatefulWidget> createState() {
    return FabBottomAppBarState();
  }
}

class FabBottomAppBarState extends State<FabBottomAppBar> {
  int _selectedIndex = 0;

  _updateSelectIndex(int index) {
    if (widget.onNavTabSelected != null) {
      widget.onNavTabSelected(index);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.navTabItems.length, (index) {
      return _buildTabItem(widget.navTabItems[index], index, (index) {
        _updateSelectIndex(index);
      }, context);
    });

    return BottomAppBar(
      elevation: 3,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items,
      ),
    );
  }

  Widget _buildTabItem(NavigationBarModel item, int index,
      ValueChanged<int> onPressed, BuildContext context) {
    List<Widget> children = [];
    bool varietyAction = item.varietyAction;
    Widget image = Image.asset(
      _selectedIndex != index ? item.normalImage : item.activeImage,
      width: varietyAction? 40:20,
      height: varietyAction? 40:27,
    );
    children.add(image);
    if(!varietyAction) {
      ThemeData themeData = Theme.of(context);
      Text text = Text(item.title,
          style: TextStyle(
              fontSize: 12,
              color: _selectedIndex != index
                  ? Colors.grey
                  : themeData.textSelectionColor));
      children.add(text);
    }
    return Expanded(
        child: SizedBox(
      height: 55,
      child: InkWell(
        onTap: () => onPressed(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children),
      ),
    ));
  }
}
