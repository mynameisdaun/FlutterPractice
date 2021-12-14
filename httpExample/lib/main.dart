import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'largeFileMain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LargeFileMain(),
    );
  }
}


class HttpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpApp();
}


class _HttpApp extends State<StatefulWidget> {
  String result = '';
  List? data;

  @override
  void initState() {
    super.initState();
    data = new List.empty(growable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
        child: Center(
          child: data!.length == 0
               ? Text('데이터가 없습니다.', style: TextStyle(fontSize: 20),textAlign: TextAlign.center)
               : ListView.builder(itemBuilder: (context, index) {
                    return Card(
                      child : Container (
                        child: Row (
                          children : <Widget>[
                            Image.network(
                              data![index]['thumbnail'],
                              height:100,
                              width:100,
                              fit: BoxFit.contain,
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width - 150,
                                  child:
                                  Text(data![index]['title'].toString(), textAlign:TextAlign.center)),
                                Text(data![index]['authors'].toString()),
                                Text(data![index]['sale_price'].toString()),
                                Text(data![index]['status'].toString()),
                              ],
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        )
                      )
                    );
          },
          itemCount: data!.length),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 69196843344e1609580e2b7896843bb3"});
    setState(() {
      var dataConvertedToJson = json.decode(response.body);
      List result = dataConvertedToJson['documents'];
      data!.addAll(result);
    });
    return response.body;
  }

}

