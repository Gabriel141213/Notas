import 'package:calcs_f/anot.dart';
import 'package:calcs_f/chackBox.dart';
import 'package:calcs_f/home.dart';
import 'package:calcs_f/lista.dart';
import 'package:calcs_f/text.dart';
import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({super.key});


  @override
  State<Note> createState() => _NoteState();

}

class _NoteState extends State<Note> {

    //var titulo = TextEditingController();
    //var anotacao = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return 
       Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 35,
                ),
                child: Material(
                  elevation: 5,
                  child: Container(
                    height: size.height * 0.29,
                    width: size.width * 0.8,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Column(
                      children: [
                        TextFormat('Título', Lista().titulo),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormat('Anotação', Lista().anotacao),
                        //SizedBox(
                          //height: size.height * 0.06,
                        //),
                        //ElevatedButton(
                            //onPressed: add,
                           // child: const Text('Finalizar')),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          /*
          SizedBox(
              height: size.height * 0.3,
              
              child: Column(
                children: [
                 Caixa(Colors.red),
                 Caixa(Colors.orange),
                 Caixa(Colors.yellow),
                 Caixa(Colors.blue)
                ],
              )
              
              ),
              
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.yellow,
                  onPressed: () {

                    //Home.valida = !valida;

                    
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (c) {
                      return Home();
                    }));
                    
                  },
                  child: const Icon(Icons.arrow_back))
            ],
            
          )
          */
          
        ],
        
      );
    
  }
}
