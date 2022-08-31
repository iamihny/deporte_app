// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServicoCadastro extends StatefulWidget {
  const ServicoCadastro({ Key? key }) : super(key: key);

  @override
  State<ServicoCadastro> createState() => _ServicoCadastroState();
}

class _ServicoCadastroState extends State<ServicoCadastro> {
  var controllerServico      =  TextEditingController();
  var controllerPontos       =  TextEditingController();

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
                controller: controllerServico,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' SERVIÇO/PRODUTO',
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
                controller: controllerPontos,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' PONTOS',
                  hintStyle: TextStyle(color: Colors.grey),
                ),              
              ),
          ),
          const SizedBox(height: 20),
          // ignore: deprecated_member_use
          ElevatedButton( 
            child: const Text("Salvar", style: TextStyle(color: Colors.white)),
            onPressed: () { 
              Firestore.instance.collection('servico').
              document().setData({'servico': controllerServico.text, 'pontos' : controllerPontos.text });
              Navigator.of(context).pop();
            } ,
          )
        ],
      ),
      
    );
  }
}