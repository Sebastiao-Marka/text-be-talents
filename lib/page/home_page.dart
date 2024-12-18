import 'dart:convert';
import 'package:betalents/page/pesquisa.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../object/usuario.dart';
import 'funcionarios.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Usuario> users = [];
  List<Usuario> usersShow = [];

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.7:8080/employees'));
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);

      setState(() {
        users = body.map((dynamic item) => Usuario.fromJson(item)).toList();
        usersShow = users;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext econtext) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CG"),
              Stack(children: [
                Icon(
                  Icons.notifications_none,
                  size: 30,
                ),
                Positioned(
                    left: 15,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 84, 48, 245),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "12",
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ))
              ])
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Funcionários",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Pesquisa(user: users),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Foto"),
                        ),
                      ),
                      Text("Nome")
                    ],
                  ),
                  Container(
                    child: Icon(
                      Icons.circle,
                      size: 10,
                    ),
                  ),
                ],
              ),
              Funcionarios(users: usersShow),
            ],
          ),
        ),
      ),
    );
  }
}
