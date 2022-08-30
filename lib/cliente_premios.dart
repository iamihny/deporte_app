import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/widget/cliente_perfil.dart';
import 'package:deporte_app/widget/perfil_card.dart';
import 'package:deporte_app/widget/resgatar_premio_card.dart';
import 'package:flutter/material.dart';

class ClientePremio extends StatefulWidget {
  final id;
  final pontosTotal;

  const ClientePremio({ Key? key, this.id, this.pontosTotal }) : super(key: key);

  @override
  State<ClientePremio> createState() => _ClientePremioState();
}

class _ClientePremioState extends State<ClientePremio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Resgatar Prêmios'),
      ),  
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
              stream: Firestore.instance.collection('premio').snapshots(),
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
                        print(document);
                        return Resgatar_card(premio: document['premio'], pontos: document['valor'].toString(), id: widget.id, pontosTotal: widget.pontosTotal,);
                         
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