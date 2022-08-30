import 'package:flutter/material.dart';

class ClientePerfil extends StatefulWidget {
  final nome;
  final pontosTotal;

  const ClientePerfil({ Key? key, this.nome, this.pontosTotal }) : super(key: key);

  @override
  State<ClientePerfil> createState() => _ClientePerfilState();
}

class _ClientePerfilState extends State<ClientePerfil> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Text(widget.nome, style: const TextStyle(color: Colors.white)),
          Text('Total de Pontos : '+widget.pontosTotal.toString(), style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}