import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_tecnico_betalent/object/usuario.dart';
import 'package:http/http.dart' as http;

class Funcionarios extends StatefulWidget {
  const Funcionarios({super.key});

  @override
  State<Funcionarios> createState() => _FuncionariosState();
}

class _FuncionariosState extends State<Funcionarios> {
List<Usuario> users = [];
bool  detalhe = false;


  Future<void>fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.1.10:8080/employees'));
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      
      setState(() {
        users = body.map((dynamic item) => Usuario.fromJson(item)).toList();
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
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height  * 0.8 ,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Container(
      width: MediaQuery.of(context).size.width,
      height: detalhe ? 150 : 70,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval( child: Image.network(users[index].image, width: 40, height: 40, fit: BoxFit.cover, )),
                        ),  
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(users[index].name, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                        ),
                      ],
                    ),
                    IconButton(onPressed: (){
                      setState(() { detalhe = !detalhe;  });},
                               icon: detalhe ? const Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down))
                  ],
                ),
               detalhe ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Job:   '),
                        Text(users[index].job),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Data de Admição:   '),
                        Text(users[index].admission_date),
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Telefone:  "),
                        Text(users[index].phone),
                      ],
                    ),
                  ],
                ): SizedBox.shrink()
              ],
            ),
          );
        },
      )
    );
  }


}
