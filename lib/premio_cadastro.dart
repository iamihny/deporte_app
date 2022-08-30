// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PremioCadastro extends StatefulWidget {
  const PremioCadastro({ Key? key }) : super(key: key);

  @override
  State<PremioCadastro> createState() => _PremioCadastroState();
}

class _PremioCadastroState extends State<PremioCadastro> {
  var controllerPremio      =  TextEditingController();
  var controllerValor       =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog (
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),            
            child: TextFormField( 
                controller: controllerPremio,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' PRÊMIO',
                  hintStyle: TextStyle(color: Colors.grey),
                ),              
              ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),            
            child: TextFormField( 
                controller: controllerValor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' VALOR',
                  hintStyle: TextStyle(color: Colors.grey),
                ),              
              ),
          ),
          const SizedBox(height: 20),
          // ignore: deprecated_member_use
          FlatButton( 
            child: const Text("Salvar", style: TextStyle(color: Colors.white)),
            color: Colors.blueGrey,
            onPressed: () { 
              Firestore.instance.collection('premio').
              document().setData({'premio': controllerPremio.text, 'valor' : controllerValor.text });
              Navigator.of(context).pop();
            } ,
          )
        ],
      ),
      
    );
  }
}