import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final usuario;
  const Item({
    super.key,
    required this.usuario,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool detalhe = false;
  @override
  Widget build(BuildContext context) {
    final isUser = widget.usuario;
    return SizedBox(
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
                    child: ClipOval(
                        child: Image.network(
                      isUser.image,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isUser.name,
                      style:
                          TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      detalhe = !detalhe;
                    });
                  },
                  icon: detalhe
                      ? const Icon(Icons.arrow_drop_up)
                      : Icon(Icons.arrow_drop_down))
            ],
          ),
          detalhe
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Job:   '),
                        Text(isUser.job),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Data de Admição:   '),
                        Text(isUser.admission_date),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Telefone:  "),
                        Text(isUser.phone),
                      ],
                    ),
                  ],
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
