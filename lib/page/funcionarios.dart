import 'package:flutter/material.dart';
import '../compnents/itens.dart';
import '../object/usuario.dart';

class Funcionarios extends StatefulWidget {
  final users;
  const Funcionarios({super.key, required List<Usuario> this.users});

  @override
  State<Funcionarios> createState() => _FuncionariosState();
}

class _FuncionariosState extends State<Funcionarios> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: widget.users.length,
          itemBuilder: (context, index) {
            return Item(
              usuario: widget.users[index],
            );
          },
        ));
  }
}
