import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/widget/cliente_perfil.dart';
import 'package:deporte_app/widget/perfil_card.dart';
import 'package:deporte_app/widget/pontos_card.dart';
import 'package:flutter/material.dart';

class ClientePontos extends StatefulWidget {
  final id;
  final pontosTotal;

  const ClientePontos({ Key? key, this.id, this.pontosTotal }) : super(key: key);

  @override
  State<ClientePontos> createState() => _ClientePontosState();
}

class _ClientePontosState extends State<ClientePontos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Gerenciar Pontos'),
      ),
      // ignore: avoid_unnecessary_containers
      body: ListView(
        shrinkWrap: true,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: StreamBuilder(
              stream: Firestore.instance.collection('barbearia').document(widget.id).snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }

                switch (snapshot.connectionState){
                  case ConnectionState.waiting:
                    const LinearProgressIndicator();
                    break;
                  default:
                    var cliente = snapshot.data;
                    return Perfil_card(nome:  cliente['nome'], pontosTotal: cliente['pontos'], cpf: cliente['cpf'] );
                    //return ClientePerfil(nome:  cliente['nome'], pontosTotal: cliente['pontos'] );
                          
                        
                }  

              // ignore: avoid_unnecessary_containers
              return Container(
                child: const Text(''),
              );                      

              },

            ),
          ),

          // ignore: avoid_unnecessary_containers
          Container(
            child: StreamBuilder(
              stream: Firestore.instance.collection('servico').snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }

                switch (snapshot.connectionState){
                  case ConnectionState.waiting:
                    const LinearProgressIndicator();
                    break;
                  default:
                return Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: snapshot.data.documents.map<Widget>((document ){
                        return PontosCard(servico: document['servico'], pontos: document['pontos'].toString(), id: widget.id, pontosTotal: widget.pontosTotal,);
                        //return Text( document['servico']+' '+document['pontos'].toString()); 
                      }).toList(),
                    ),
                );
                }  

              // ignore: avoid_unnecessary_containers
              return Container(
                child: const Text(''),
              );                      

              },

            ),
          ),
        ],

      )

      
    );
  }



}