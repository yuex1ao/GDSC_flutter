import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'index_page.dart';

class Pages {
  static const String intro = '/intro'; // 定義路由名稱
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String index = '/index';
  static const String profile = '/profile';
  static const String task = '/task';

  static String get initialRoute => intro; // 初始頁面

  static Map<String, WidgetBuilder> routes = {
    intro: (context) => const IntroPage(), // call IntroPage's WidgetBuilder
    index: (context) => const IndexPage(),
  };
}