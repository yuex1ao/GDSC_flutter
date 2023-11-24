import 'package:flutter/material.dart';
import 'pages.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<StatefulWidget> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome!!!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
              )
            ),
          ]
        ),
      ),
    );
  }
}