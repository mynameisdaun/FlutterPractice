import 'package:flutter/material.dart';
import 'package:untitled/squirtleLoading.dart';
import 'dart:async';
import 'main.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        child: Center(
          child: Column (
            children: <Widget>[
              Text('에니메이션 앱'),
              SizedBox(
                height: 20,
              ),
              SquirtleLoading()
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ),
      ),
    );
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 300), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => AnimationApp()));
  }
}
