
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Perfil_card extends StatefulWidget {
  final nome;
  final cpf;
  final pontosTotal;

  const Perfil_card({ Key? key, this.nome, this.cpf, this.pontosTotal }) : super(key: key);

  @override
  State<Perfil_card> createState() => _State();
}

class _State extends State<Perfil_card> {
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      color: Colors.blueGrey,
      elevation: 2,
      child: InkWell(
        //onTap: () => abrirDetalhes(),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              const Icon(Icons.people, size: 52, color: Colors.white),
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
                          color: Colors.black
                        ),
                      ),

                      Text(
                        widget.pontosTotal.toString()+' pontos',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ), 
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}