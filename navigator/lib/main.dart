import 'package:flutter/material.dart';
import 'navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: snackBar(),
    );
  }
}

class snackBar extends StatefulWidget {
  const snackBar({Key? key}) : super(key: key);

  @override
  _snackBarState createState() => _snackBarState();
}

class _snackBarState extends State<snackBar> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'for SnackBar!',
               style: TextStyle(fontSize: 40, color: Colors.white)
            ),
          ),
          body: Container(
            child: ElevatedButton(
              child: Icon(Icons.adb),
              onPressed: () {
                showSnackBar(ctx);
              },
            ),
          ),
        );
      }
    );
  }
  
  void showSnackBar(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text("hi~"))
    );
  }
}

