import 'package:flutter/material.dart';
import 'package:oschina/common/util/common_utils.dart';
import 'package:oschina/model/nav_data.dart'
    show initNavigationBarModel, NavigationBarModel;
import 'package:oschina/module/discover/widget/discover_main.dart';
import 'package:oschina/module/my/widget/my_main.dart';
import 'package:oschina/module/news/widget/news_main.dart';
import 'package:oschina/module/tweet/widget/tweet_main.dart';
import 'package:oschina/resources/colors.dart';

class DataCollection {
  List<Widget> _bodyArray;
  List<BottomNavigationBarItem> _navItemList;

  void init() {
    _bodyArray = [
      NewsMainWidget(),
      TweetMainWidget(),
      //VarietyActionWidget(),
      DiscoverMainWidget(),
      MyMainWidget()
    ];
    List<NavigationBarModel> navItemData = initNavigationBarModel();
    _navItemList = List.generate(navItemData.length, (index) {
      NavigationBarModel data = navItemData[index];
      return BottomNavigationBarItem(
        title: Text(
          data.title,
//          style: TextStyle(
//            color: Colors.black,
//          ),
        ),
        icon: Image.asset(
          data.normalImage,
          width: 24,
          height: 28,
        ),
        activeIcon: Image.asset(
          data.activeImage,
          width: 24,
          height: 28,
        ),
      );
    });
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  PageController _mainPageController;
  int _currentPageIndex;
  DataCollection _dataCollection;

  void _pageChange(int index) {
    setState(() =>
        ifNoEqual(_currentPageIndex, index, () => _currentPageIndex = index));
  }

  @override
  void initState() {
    super.initState();
    _dataCollection = DataCollection();
    _dataCollection.init();
    _currentPageIndex = 0;
    _mainPageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _mainPageController,
        itemCount: _dataCollection._bodyArray.length,
        itemBuilder: (context, index) {
          print("itemBuilder index=$index");
          return _dataCollection._bodyArray[index];
        },
        onPageChanged: (index) {
          print("onPageChanged lastIndex=$_currentPageIndex");
          _pageChange(index);
          print("onPageChanged changedIndex=$_currentPageIndex");
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        currentIndex: _currentPageIndex,
        items: _dataCollection._navItemList,
        onTap: (index) {
          _mainPageController.animateToPage(index,
              duration: Duration(microseconds: 1), curve: Curves.ease);
        },
      ),
//      bottomNavigationBar: Stack(
//        children: <Widget>[
//          Container(
//            alignment: Alignment.bottomCenter,
//            child: BottomNavigationBar(
//              type: BottomNavigationBarType.fixed,
//              unselectedFontSize: 10,
//              selectedFontSize: 12,
//              currentIndex: _currentPageIndex,
//              items: _dataCollection._navItemList,
//              onTap: (index) {
//                _mainPageController.animateToPage(index,
//                    duration: Duration(microseconds: 1), curve: Curves.ease);
//              },
//            ),
//          ),
//          Container(
//            alignment: Alignment.bottomRight,
//            margin: EdgeInsets.only(left: 0,top: 0,right: 10,bottom: 80),
//            child: FloatingActionButton(onPressed: null,
//              mini: true,
//              child: Icon(Icons.add),
//            ),
//          )
//
//
//        ],
//      ),

//      floatingActionButton: FloatingActionButton(
//        mini: true,
//        elevation: 1,
//        onPressed: null,
//        child: Icon(Icons.add),
//      ),
//      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//      bottomNavigationBar: FabBottomAppBar(
//          currentPage:_currentPageIndex,
//        navTabItems:initNavigationBarModel(),
//        onNavTabSelected: (index) {
//          print("onNavTabSelected index=$index");
//          _pageChange(index);
//          _pageController.animateToPage(index,
//              duration: Duration(milliseconds: 1000), curve: Curves.ease);
//        },
//      ),
    );
  }
}
