import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Resgatar_card extends StatefulWidget {
  final premio;
  final pontos;
  final pontosTotal;
  final id;

  const Resgatar_card({ Key? key, this.premio, this.pontos, this.pontosTotal, this.id }) : super(key: key);

  @override
  State<Resgatar_card> createState() => _Resgatar_card();
}

class _Resgatar_card extends State<Resgatar_card> {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.premio,
                            style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600)
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ignore: deprecated_member_use
                              ElevatedButton(              
                                onPressed: (){  
                                  var sub;
                                  total = cliente['pontos'];
                                  if (total > int.parse(widget.pontos)) {
                                    sub = total - int.parse(widget.pontos);
                                    Firestore.instance.collection("barbearia").document(widget.id).updateData({'pontos':sub});
                                    total = cliente['pontos'];             
                                  } else {
                                      const AlertDialog(content: Text('Você não tem Pontos Suficientes!'),);
                                  }    
                                }, 
                                child: Text('Resgatar '+widget.pontos.toString()+' pontos', style: TextStyle(color: Colors.white))
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