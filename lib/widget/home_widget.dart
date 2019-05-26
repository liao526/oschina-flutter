import 'package:flutter/material.dart';
import 'package:oschina/model/nav_data.dart' show initNavigationBarModel;
import 'package:oschina/module/common/widget/variety_action.dart';
import 'package:oschina/module/discover/widget/discover_main.dart';
import 'package:oschina/module/my/widget/my_main.dart';
import 'package:oschina/module/news/widget/news_main.dart';
import 'package:oschina/module/tweet/widget/tweet_main.dart';
import 'bottom_nav_bar.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  PageController _pageController;
  List<Widget> _bodyArray;

  @override
  void initState() {
    super.initState();
    _bodyArray = [
      NewsMainWidget(),
      TweetMainWidget(),
      VarietyActionWidget(),
      DiscoverMainWidget(),
      MyMainWidget()
    ];
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _bodyArray.length,
        itemBuilder: (context, index) {
          return _bodyArray[index];
        },
        onPageChanged: (index) {},
      ),
/*      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: null,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,*/
      bottomNavigationBar: FabBottomAppBar(
        initNavigationBarModel(),
        onNavTabSelected: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 600), curve: Curves.ease);
        },
      ),
    );
  }
}
