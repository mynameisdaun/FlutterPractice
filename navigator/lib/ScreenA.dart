import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

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

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go to First Page'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}