// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/premio_cadastro.dart';
import 'package:deporte_app/widget/premio_card.dart';
import 'package:flutter/material.dart';

class Premio extends StatefulWidget {
  const Premio({ Key? key }) : super(key: key);

  @override
  State<Premio> createState() => _PremioState();
}

class _PremioState extends State<Premio> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    // ignore: unnecessary_new
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Prêmios'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('premio').snapshots(),
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
                        return Premio_Card(
                          premio: document['premio'], 
                          valor: document['valor'],
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
              builder: (_) => const PremioCadastro()
            );            
          },
          child: const Text('Adicionar Prêmio', style: TextStyle(color: Colors.white)),
        )
      )
      ),

    ); 
    
  }

}