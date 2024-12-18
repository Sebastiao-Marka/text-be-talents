import 'package:betalents/page/home_page.dart';
import 'package:flutter/material.dart';

import '../object/usuario.dart';

class Pesquisa extends StatefulWidget {
  final user;
  const Pesquisa({super.key, required this.user});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  TextEditingController _searchController = TextEditingController();
  String hintText = "Pesquisar";

  List<Usuario> usersShow = [];

  pesquisa(String text) {
    List<Usuario> users = widget.user;
    setState(() {
      usersShow.clear();
    });
    if (users.isNotEmpty) {
      for (var i = 0; i < users.length; i++) {
        if (text.isEmpty) {
          return;
        } else if (users[i].name == text) {
          setState(() {
            usersShow.add(users[i]);
          });
          return;
        } else if (users[i].job.contains(text)) {
          setState(() {
            usersShow.add(users[i]);
          });
          return;
        } else {
          setState(() {
            usersShow.clear();
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        onEditingComplete: () {
          pesquisa(_searchController.text);
        },
        decoration: InputDecoration(
          enabled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            gapPadding: 30,
            borderSide: BorderSide(width: 0.0),
          ),
          prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _searchController.text = '';
                });
              },
              icon: Icon(Icons.cancel)),
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}
