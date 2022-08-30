import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Servico_Card extends StatefulWidget {
  final servico;
  final pontos;
  final id;

  const Servico_Card({ Key? key, this.servico, this.pontos, this.id }) : super(key: key);

  @override
  State<Servico_Card> createState() => _ServicoCardState();
}

class _ServicoCardState extends State<Servico_Card> {
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
              const Icon(Icons.cut_rounded, size: 52, color: Colors.blueGrey),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.servico,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.pontos.toString(),
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
                      title: const Text('Excluir Produto/Servico'),
                      onTap: () {
                       print('Id documeto :'+widget.id);
                       Firestore.instance.collection("servico").document(widget.id).delete();
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