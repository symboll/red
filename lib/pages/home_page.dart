import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getHttp().then((value) => print(value));
  }

  Future<List<Favor>> getHttp() async {
    try {
      http.Response response = await http.get('http://localhost:8000/test/getfavor');
      if(response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        List<Favor> favors = responseBody['favor']
          .map<Favor>((item)=> Favor.fromJson(item))
          .toList();

        return favors;
      } else {
        throw Exception('Failed to fetch info');
      }
    }catch (e) {
      throw Exception('Failed to fetch info: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}


class Favor{
  final int id;
  final int uid;
  final int type;

  Favor(
    this.id,
    this.uid,
    this.type
  );
  Favor.fromJson(Map json) 
    : id = json['id'], 
      uid = json['uid'],
      type = json['type'];
}