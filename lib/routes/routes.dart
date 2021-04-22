import 'package:flutter/material.dart';

import 'package:flutter_app_progress/pages/home.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    // 'alert': (BuildContext context) => AlertPage(),
    // 'avatar': (BuildContext context) => AvatarPage(),
    // 'card': (BuildContext context) => CardPage(),
    // 'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    // 'inputs': (BuildContext context) => InputPage(),
    // 'slider': (BuildContext context) => SliderPage(),
    // 'list': (BuildContext context) => ListPage(),
  };
}
