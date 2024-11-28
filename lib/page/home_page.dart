
import 'package:flutter/material.dart';
import 'package:test_tecnico_betalent/page/funcionarios.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerPesquisa = TextEditingController();
  String hintText = "Pesquisar";
  
  get http => null;
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
          height: MediaQuery.of(context).size.height ,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Funcionários",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllerPesquisa,
                  decoration: InputDecoration(
                    enabled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 30,
                      borderSide: BorderSide(width: 0.0),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: hintText,
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ),
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
                  ),Container(
                    child: Icon(Icons.circle, size: 10,),
                  ),
                 
                ],
              ),
             
            Funcionarios(),
             
            ],
          ),
        ),
      ),
    );
  }
}
