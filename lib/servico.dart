// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/servico_cadastro.dart';
import 'package:deporte_app/widget/servico_card.dart';
import 'package:flutter/material.dart';

class Servico extends StatefulWidget {
  const Servico({ Key? key }) : super(key: key);

  @override
  State<Servico> createState() => _ServicoState();
}

class _ServicoState extends State<Servico> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    // ignore: unnecessary_new
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Serviços'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('servico').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
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
                      children: snapshot.data.documents.map<Widget>((document ){
                        return Servico_Card(
                          servico: document['servico'], 
                          pontos: document['pontos'],
                          id: document.documentID,
                        );
                       
                      }).toList(),
                    ),
                );
                  

            } 
          
          // ignore: avoid_unnecessary_containers
          return Container(
            child: const Text(''),
          );

        },
      )
      
    ),
    // ignore: unnecessary_const
    bottomNavigationBar: BottomAppBar(
      child: Container(
        height: 50,
        color: Colors.blueGrey,
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: () async { 
            await showDialog(
              context: context,
              builder: (_) => const ServicoCadastro()
            );            
          },
          child: const Text('Adicionar Serviços/Produtos', style: TextStyle(color: Colors.white)),
        )
      )
      ),

    ); 
    
  }
}