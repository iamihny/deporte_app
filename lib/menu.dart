import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Menu extends StatefulWidget {
  const Menu({ Key? key }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deporte Barbearia")
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // ignore: sized_box_for_whitespace
          Container(
            height: 80,
            child: Image.asset("assets/logo.jpg"),
          ),        
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [              
              const SizedBox(height: 50),
              // ignore: deprecated_member_use
              ElevatedButton(
                child: Container(
                  width: 100,
                  child: Center(
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.account_box_outlined, color: Colors.white), 
                        const Text('Clientes', style: TextStyle(color: Colors.white)),
                      ],
                    )  
                  ),
                ),
                onPressed: () {  
                  Get.toNamed('/cliente');
                },
              ),
              // ignore: deprecated_member_use
              ElevatedButton(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(Icons.content_cut, color: Colors.white), 
                        const Text('Produtos e Serviços', style: TextStyle(color: Colors.white)),
                      ],
                    )  
                ),
                ), 
                onPressed: () {  
                  Get.toNamed('/servico');
                },
              ),  
              // ignore: deprecated_member_use
              ElevatedButton(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(Icons.star_rate_rounded, color: Colors.white), 
                        const Text('Prêmios', style: TextStyle(color: Colors.white)),
                      ],
                    )  
                ),
                ), 
                onPressed: () {  
                  Get.toNamed('/premio');
                },
              ),                           
            ],
          )
        ],
      )
       
      
    );
  }
}