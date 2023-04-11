import 'package:flutter/material.dart';

import 'anot.dart';
import 'lista.dart';
import 'note.dart';


class Home extends StatefulWidget {
/*   
  List<Anot>? anota;
  Home() {
    anota = [];
    anota!.add(Anot(title: "Olá", anotacao: "Ola"));
  }
*/
  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    //bool valida = false;

     return Scaffold(
      appBar: AppBar(
        title: const Text('Anotações pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Lista()),
          const Padding(
            padding: EdgeInsets.all(30),
           
          )
        ],
      )
    );
  }
}
