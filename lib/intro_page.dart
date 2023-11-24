import 'dart:math';
import 'package:flutter/material.dart';
import 'pages.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  // This widget is the root of your application.
  @override
  State<IntroPage> createState() => MyHomePage();
}

class MyHomePage extends State<IntroPage> {
  int index = 0;

  List<String> images = [
    'assets/images/welcome1.png',
    'assets/images/welcome2.png',
    'assets/images/welcome3.png',
  ];

  List<String> titles = [
    'Manage your tasks',
    'Create daily routine',
    'Organize your tasks',
  ];

  List<String> descriptions = [
    'You can easily manage all of your daily tasks in DoMe for free',
    'In Uptodo  you can create your personalized routine to stay productive',
    'You can organize your daily tasks by adding your tasks into separate categories',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center( // center只能有一個子Widget，所以要有多個子Widget的話要包在child裡面。
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: _onGetStarted,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0), // 按鈕內邊距(left, top, right, bottom)
                  ),
                  child: const Text(
                    "SKIP",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white38,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(images[index]),
                ),
                Container(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i = 0; i < 3; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          height: 4,
                          width: 30,
                          color: (i == index) ? Colors.white : Colors.grey,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text: titles[index],
                style: const TextStyle(color: Color.fromARGB(255, 230, 230, 230), fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28), // 在左右兩側加上28px的空間
              child: Text(
                descriptions[index],
                style: const TextStyle(color: Color.fromARGB(255, 150, 150, 150), fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (index == 0) ? const SizedBox() : TextButton(
                  onPressed: _onBack,
                  child: const Text(
                    "BACK",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white38,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (index == 2) ? _onGetStarted: _onNext,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    minimumSize: const Size(100,50),
                  ),
                  child: Text(
                    (index == 2) ? "GET STARTED" : "NEXT",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onBack() {
    setState(() { // setState() 用來通知flutter重新建構Widget，flutter會重新run build
      index = max(index - 1, 0);
    });
  }

  void _onNext() {
    setState(() {
      index = min(index + 1, 2);
    });
  }

  void _onGetStarted() {
    Navigator.of(context).pushNamed(Pages.index);
  }
}