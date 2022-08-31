// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deporte_app/cliente_cadastro.dart';
import 'package:deporte_app/widget/cliente_card.dart';
import 'package:flutter/material.dart';

class Cliente extends StatefulWidget {
  const Cliente({ Key? key }) : super(key: key);

  @override
  State<Cliente> createState() => _ClienteState();
}

class _ClienteState extends State<Cliente> {
  var controllerNome      =  TextEditingController(); 
  String nome  = '';

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    // ignore: unnecessary_new
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Clientes'),

      ),
      // ignore: avoid_unnecessary_containers
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),            
            child: TextFormField( 
                controller: controllerNome,
                onChanged: (value){
                  print(value);
                  setState(() {
                    nome = value;  
                  });
                  
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' PESQUISAR CLIENTE',
                  hintStyle: TextStyle(color: Colors.grey),
                ),              
              ),
          ), 

      // ignore: avoid_unnecessary_containers
      Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection('barbearia').orderBy('nome').snapshots(),
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
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,                        
                        children: snapshot.data.documents.map<Widget>((document){
                          if (document['nome'].toString().contains(nome))  
                            // ignore: curly_braces_in_flow_control_structures
                            return Cliente_card(
                              nome: document['nome'], 
                              cpf: document['cpf'],
                              pontosTotal: document['pontos'],
                              id: document.documentID,
                            );
                            else
                              // ignore: curly_braces_in_flow_control_structures
                              return Container();
                          /*
                          return ListTile(
                            trailing: const Icon(Icons.people, size: 52),
                            title: Text(document['nome']),
                            subtitle: Text(document['cpf']),
                          );*/
                        
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



        ],
      ),
      /*
      body: Container(
        child: StreamBuilder(
          stream: Firestore.instance.collection('barbearia').orderBy('nome').snapshots(),
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
                        children: snapshot.data.documents.map<Widget>((document){
                          if (document['nome'].toString().contains(''))  
                            // ignore: curly_braces_in_flow_control_structures
                            return Cliente_card(
                              nome: document['nome'], 
                              cpf: document['cpf'],
                              pontosTotal: document['pontos'],
                              id: document.documentID,
                            );
                            else
                              // ignore: curly_braces_in_flow_control_structures
                              return Container();
                          /*
                          return ListTile(
                            trailing: const Icon(Icons.people, size: 52),
                            title: Text(document['nome']),
                            subtitle: Text(document['cpf']),
                          );*/
                        
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
      
    ), */
    // ignore: unnecessary_const
    bottomNavigationBar: BottomAppBar(
      child: Container(
        height: 50,
        color: Colors.blueGrey,
        child: ElevatedButton(
          onPressed: () async { 
            await showDialog(
              context: context,
              builder: (_) => const ClienteCadastro()
            );            
          },
          child: const Text('Adicionar Clientes', style: TextStyle(color: Colors.white)),
        )
      )
      ),

    ); 
    
  }
}