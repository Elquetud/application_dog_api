import 'dart:convert';

import 'package:application_dog_api/models/Dog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Api Aplication.',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dog Api Aplication Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

  class _MyHomePageState extends State<MyHomePage> {

    late Future<List<DogList>> _listadoDogs;

    Future<List<DogList>> _getDogs() async{
      final response =await http.get("https://dog.ceo/api/breeds/list/all");
      
      if(response.statusCode ==200 ){
       print(response.body);
      }else{
        throw Exception("Fallo la conexión");
      }
      return _getDogs();
    }

  @override
  void initState() {
    super.initState();
    _getDogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              

          ],
        ),
      ),
    );
  }

}
