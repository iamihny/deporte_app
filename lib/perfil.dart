import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({ Key? key }) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deporte Barbearia'),
      ),

      body: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ Colors.blueGrey, Colors.white]
              )
            ),
            // ignore: sized_box_for_whitespace
            child: Container(
              width: double.infinity,
              height: 350.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Lurdinha da Silva",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  const Text(
                                    "Pontos",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  const Text(
                                    "5200",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ),
          const SizedBox(
            height: 20.0,
          ),

          Container(
              height: 100,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('bone.jpg')
//                      image: NetworkImage('https://cf.shopee.com.br/file/6721a598973a61b97a1c19b58e2def07')
                      )
                    )
                  ),
          FractionalTranslation(
            translation: Offset(0, -0.5),
            child: Container(
              width: 160,
              height: 70,
              child: const Center(
                  child: Text(
                'boné',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 5, color: Colors.white)),
            ),
          ),
          const FractionalTranslation(
            translation: Offset(0, -1),
            child: Text(
              '3000 pts',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),


        ],
      ),

      
    );
  }
}