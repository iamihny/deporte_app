import 'package:deporte_app/cliente_pontos.dart';
import 'package:deporte_app/perfil.dart';
import 'package:deporte_app/premio.dart';
import 'package:deporte_app/servico.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cliente.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Deporte Barbearia'),
      getPages:[
        GetPage(name: '/menu', page: () => Menu()),
        GetPage(name: '/perfil', page: () => Perfil()),
        GetPage(name: '/cliente', page: () => Cliente()),
        GetPage(name: '/clientepontos', page: () => ClientePontos()),
        GetPage(name: '/servico', page: () => Servico()),
        GetPage(name: '/premio', page: () => Premio()),
      ]
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controllerCPF = TextEditingController();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100),
            Image.asset("assets/logo.jpg"),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controllerCPF,
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'CPF',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      textInputAction: TextInputAction.next,                   
                      onFieldSubmitted: (term) {

                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                         
                          return "Informe o CPF!";
                        }
                      },
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: ElevatedButton(
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "ENTRAR",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Transform.translate(
                            offset: const Offset(15.0, 0.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              child: ElevatedButton(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Color.fromRGBO(38, 97, 169, 1),
                                ),
                                onPressed: () {
                                   Navigator.of(context).pushReplacementNamed('menu'); 

                                  },
                              ),
                            ),
                          )
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('menu'); 
                      },
                    )
                )
              ]
              )
            )

          ],
        ),
      ),
    );
  }
}
