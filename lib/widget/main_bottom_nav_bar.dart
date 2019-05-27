import 'package:flutter/material.dart';
import 'package:oschina/common/util/common_utils.dart';
import 'package:oschina/model/nav_data.dart' show NavigationBarModel;

class FabBottomAppBar extends StatefulWidget {
  final List<NavigationBarModel> navTabItems;
  final ValueChanged<int> onNavTabSelected;
  final int currentPage;

  FabBottomAppBar({this.navTabItems, this.onNavTabSelected, this.currentPage})
      : assert(navTabItems != null),
        assert(0 <= currentPage && currentPage < navTabItems.length);

  @override
  State<StatefulWidget> createState() {
    return FabBottomAppBarState();
  }
}

class FabBottomAppBarState extends State<FabBottomAppBar> {
  int _currentTab;
  List<Widget> _navItemWidgets;

  _updateSelectIndex(int index) {
    setState(() {
      ifNoEqual(_currentTab, index, () {
        _currentTab = index;
        ifNoNull(widget.onNavTabSelected, () => widget.onNavTabSelected(index));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print("FabBottomAppBarState initState");
    _currentTab = widget.currentPage;
    _navItemWidgets = List.generate(widget.navTabItems.length, (index) {
      return _buildTabItem(
          widget.navTabItems[index], index, _updateSelectIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    NavigationBarModel model = widget.navTabItems[_currentTab];
    Widget item = _buildTabItem(model, _currentTab, _updateSelectIndex);
    _navItemWidgets[_currentTab] = item;

    return BottomAppBar(
      elevation: 3,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _navItemWidgets,
      ),
    );
  }

  Widget _buildTabItem(
      NavigationBarModel item, int index, ValueChanged<int> onPressed) {
    List<Widget> children = [];
    bool varietyAction = item.varietyAction;
    Widget image = Image.asset(
      _currentTab != index ? item.normalImage : item.activeImage,
      width: varietyAction ? 40 : 20,
      height: varietyAction ? 40 : 27,
    );
    children.add(image);
    if (!varietyAction) {
      Text text = Text(item.title,
          style: TextStyle(
              fontSize: 12,
              color: _currentTab != index ? Colors.grey : Colors.black));
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
