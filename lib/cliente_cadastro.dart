// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClienteCadastro extends StatefulWidget {
  const ClienteCadastro({ Key? key }) : super(key: key);

  @override
  State<ClienteCadastro> createState() => _ClienteCadastroState();
}

class _ClienteCadastroState extends State<ClienteCadastro> {
  var controllerNome      =  TextEditingController();
  var controllerCPF       =  TextEditingController();
  var controllerTelefone  =  TextEditingController();


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
                controller: controllerNome,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' NOME DO CLIENTE',
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
                controller: controllerCPF,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' CPF',
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
                controller: controllerTelefone,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: ' TELEFONE',
                  hintStyle: TextStyle(color: Colors.grey),
                ),              
              ),
          ),
          const SizedBox(height: 20),
          // ignore: deprecated_member_use
          ElevatedButton( 
            child: const Text("Salvar", style: TextStyle(color: Colors.white)),
            onPressed: () { 
              Firestore.instance.collection('barbearia').
              document(controllerCPF.text).setData({'nome': controllerNome.text, 'cpf' : controllerCPF.text, 'telefone' : controllerTelefone.text, 'pontos': 0 });
              Navigator.of(context).pop();
            } ,
          )
        ],
      ),
      
    );
  }
}