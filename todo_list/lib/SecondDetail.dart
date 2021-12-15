import 'package:flutter/material.dart';

class SecondDetail extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SecondDetail();

}

class _SecondDetail extends State<SecondDetail> {
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container (
        child: Center (
          child: Column (
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton (
                onPressed: () {
                  Navigator.of(context).pop(controller.value.text);
                },
                child: Text('save'),
              )
            ],
          ),
        )
      ),
    );
  }
}