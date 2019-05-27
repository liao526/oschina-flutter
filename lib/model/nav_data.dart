class NavigationBarModel {
  String title;
  String normalImage;
  String activeImage;
  bool varietyAction;

  NavigationBarModel(
      {this.varietyAction, this.normalImage, this.activeImage, this.title});
}

final navNameArray = ["资讯", "动弹", "发现", "我的"];
final normalImageArray = [
  "assets/images/nav/ic_nav_news_normal.png",
  "assets/images/nav/ic_nav_tweet_normal.png",
  /*"assets/images/nav/ic_nav_action_normal.png",*/
  "assets/images/nav/ic_nav_discover_normal.png",
  "assets/images/nav/ic_nav_my_normal.png"
];
final activeImageArray = [
  "assets/images/nav/ic_nav_news_actived.png",
  "assets/images/nav/ic_nav_tweet_actived.png",
  /*"assets/images/nav/ic_nav_action_normal.png",*/
  "assets/images/nav/ic_nav_discover_actived.png",
  "assets/images/nav/ic_nav_my_actived.png"
];

List<NavigationBarModel> initNavigationBarModel() {
  return <NavigationBarModel>[
    NavigationBarModel(
        varietyAction: false,
        normalImage: normalImageArray[0],
        activeImage: activeImageArray[0],
        title: navNameArray[0]),
    NavigationBarModel(
        varietyAction: false,
        normalImage: normalImageArray[1],
        activeImage: activeImageArray[1],
        title: navNameArray[1]),
//    NavigationBarModel(
//        varietyAction: true,
//        normalImage: normalImageArray[2],
//        activeImage: activeImageArray[2],
//        title: navNameArray[2]),
    NavigationBarModel(
        varietyAction: false,
        normalImage: normalImageArray[2],
        activeImage: activeImageArray[2],
        title: navNameArray[2]),
    NavigationBarModel(
        varietyAction: false,
        normalImage: normalImageArray[3],
        activeImage: activeImageArray[3],
        title: navNameArray[3]),
  ];
}
