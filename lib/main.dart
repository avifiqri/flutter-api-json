import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataJson;

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {'accept': "Applcation/json"});
    setState(() {
      dataJson = json.decode(response.body);
    });
    return "Succsess";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list json"),
      ),
      body: ListView.builder(
          itemCount: dataJson == null ? 0 : dataJson.length,
          itemBuilder: (BuildContext context, int i) {
            return Card(
              shadowColor: Colors.blue,
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Text("title= "),
                      ),
                      Flexible(
                        child: Text(dataJson[i]['title']),
                      ),
                    ],
                  ),
                   Row(
                    children: <Widget>[
                      Flexible(
                        child: Text("body= "),
                      ),
                      Flexible(
                        child: Text(dataJson[i]['body']),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
