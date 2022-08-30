
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/cliente_pontos.dart';
import 'package:deporte_app/cliente_premios.dart';
import 'package:deporte_app/widget/resgatar_premio_card.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Cliente_card extends StatefulWidget {
  final nome;
  final cpf;
  final id;
  final pontosTotal;

  const Cliente_card({ Key? key, this.nome, this.cpf, this.id, this.pontosTotal }) : super(key: key);

  @override
  State<Cliente_card> createState() => _State();
}

class _State extends State<Cliente_card> {
  
  
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
              const Icon(Icons.people, size: 52, color: Colors.blueGrey),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nome,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.cpf,
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
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text('Gerenciar Pontos'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ClientePontos(id: widget.id, pontosTotal: widget.pontosTotal,))); 
                          },
                        ), 
                        ListTile(
                          title: const Text('Resgatar Prêmios'),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ClientePremio(id: widget.id, pontosTotal: widget.pontosTotal,))); 
                          },
                        ),                        
                        ListTile(
                          title: const Text('Excluir Cliente'),
                          onTap: () {
                          // ignore: avoid_print
                          print('Id documeto :'+widget.id);
                          Firestore.instance.collection("barbearia").document(widget.id).delete();                          
                          },
                        ),
                      ],
                    ) 
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