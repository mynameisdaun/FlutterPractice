import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go to second Page'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (_) => SecondPage()));
          },
        ),
      ),
    );
  }
}