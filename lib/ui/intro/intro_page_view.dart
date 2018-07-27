import 'package:flutter/material.dart';
import 'package:flutter_currency_app/model/intro.dart';
import 'package:flutter_currency_app/ui/intro/intro_page.dart';
import 'package:flutter_currency_app/ui/intro/intro_page_item.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class IntroPageView extends IntroPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            itemCount: introItems.length,
            itemBuilder: (_, int i) => IntroPageItem(item: introItems[i]),
          ),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(16.0),
            child: _indicator(),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              key: const Key("SkipButton"),
              padding: EdgeInsets.all(16.0),
              onPressed: () => startApp(context),
              child: Text("Skip",
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  PageViewIndicator _indicator() {
    return PageViewIndicator(
      pageController: controller,
      length: introItems.length,
      normalBuilder: (animationController) => Circle(
            size: 8.0,
            color: Colors.white,
          ),
      highlightedBuilder: (animationController) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Colors.white70,
            ),
          ),
    );
  }
}
