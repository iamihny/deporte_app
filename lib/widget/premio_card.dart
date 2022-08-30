import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Premio_Card extends StatefulWidget {
  final premio;
  final valor;
  final id;

  const Premio_Card({ Key? key, this.premio, this.valor, this.id }) : super(key: key);

  @override
  State<Premio_Card> createState() => _Premio_CardState();
}

// ignore: camel_case_types
class _Premio_CardState extends State<Premio_Card> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        //onTap: () => abrirDetalhes(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              const Icon(Icons.star, size: 52, color: Colors.blueGrey),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.premio,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.valor.toString(),
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      title: const Text('Excluir Prêmio'),
                      onTap: () {
                       // ignore: avoid_print
                       print('Id documeto :'+widget.id);
                       Firestore.instance.collection("premio").document(widget.id).delete();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}