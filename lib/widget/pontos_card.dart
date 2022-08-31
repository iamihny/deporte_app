import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PontosCard extends StatefulWidget {
  final servico;
  final pontos;
  final pontosTotal;
  final id;

  const PontosCard({ Key? key, this.servico, this.pontos, this.id, this.pontosTotal }) : super(key: key);

  @override
  State<PontosCard> createState() => _PontosCardState();
}

class _PontosCardState extends State<PontosCard> {
  var total = 0;  

  @override
  void initState() {
    super.initState();
    total = widget.pontosTotal;
  }  

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
              return Card(
                      child: Column(
                        children: [
                          Text(widget.servico),
                          Text('Pontos :'+widget.pontos.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // ignore: deprecated_member_use
                              ElevatedButton(   
                                onPressed: (){ 
                                  var soma;
                                  total = cliente['pontos'];
                                  soma = int.parse(widget.pontos) + total;
                                  Firestore.instance.collection("barbearia").document(widget.id).updateData({'pontos':soma});
                                  total = cliente['pontos'];
                                }, 
                                child: const Text('Adicionar Pontos', style: TextStyle(color: Colors.white))
                              ),
                              // ignore: deprecated_member_use
                              ElevatedButton(                 
                                onPressed: (){  
                                  var sub;
                                  total = cliente['pontos'];
                                  sub = total - int.parse(widget.pontos);
                                  Firestore.instance.collection("barbearia").document(widget.id).updateData({'pontos':sub});
                                  total = cliente['pontos'];                  
                                }, 
                                child: const Text('Remover Pontos', style: TextStyle(color: Colors.white))
                              )
                            ],
                          )
                        ],
                      ) 
                    );
          } 

          return Container(
            child: const Text(''),
          );  
        },
    );


  }
}