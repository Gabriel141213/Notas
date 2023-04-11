//import 'dart:js_util';
import 'package:calcs_f/chackBox.dart';
import 'package:calcs_f/text.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'anot.dart';
import 'note.dart';

class Lista extends StatefulWidget {
  bool newNote = true;
  var titulo = TextEditingController();
  var anotacao = TextEditingController();
  Color? cor1;


  List<Anot>? anota;
  Lista() {
    anota = [];
    anota!.add(Anot(title: "Olá mundo", anotacao: "Ola", cor: Colors.blue));
    anota!.add(Anot(title: "Olá mundo", anotacao: "Ola", cor: Colors.yellow));
  }

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  Caixa caixa1 = Caixa(Colors.red, false);
  Caixa caixa2 = Caixa(Colors.yellow, false);
  Caixa caixa3 = Caixa(Colors.blue, false);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    setState((){
        if(caixa1.done == true){
          caixa2.done = caixa3.done = false;
        }
        else if(caixa2.done == true){
          caixa1.done = caixa3.done = false;
        }
        else if(caixa3.done == true){
          caixa1.done = caixa2.done = false;
        }
  
    });

    //widget.cor1 = caixa1.done ?  Colors.red : caixa2.done? Colors.yellow : Colors.blue;
    
    void add() {
      setState(() {
        widget.cor1 = caixa1.done ?  Colors.red : caixa2.done? Colors.yellow : Colors.blue; 
        widget.anota!.add(Anot(title: widget.titulo.text, anotacao: widget.anotacao.text, cor: widget.cor1)); 
        widget.titulo.text = '';
        widget.anotacao.text = '';
      });
    
    }
    
    void remove (int index) {
      setState(() {
        widget.anota!.removeAt(index);
    });

    }
          

    return  Column(
      children: [
        widget.newNote == true ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 35,
              ),
              child: Material(
                elevation: 5,
                child: Container(
                  height: size.height * 0.36,
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
                      TextFormat('Título', widget.titulo),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      TextFormat('Anotação', widget.anotacao),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: caixa1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: caixa2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: caixa3,
                        )
                      ],)
                    ],
                  ), 
                ),
              ),
            ),
          ],
        ) : Container(child: Text('s'),),
        Expanded(
          child: ListView.builder(
            itemCount: widget.anota!.length,
            itemBuilder: (ctxt, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Remover'),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  remove(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 10,
                    ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.anota![index].cor,
                    ),
                    height: size.height * 0.1,
                    width: size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Icon(
                              Icons.person
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 18.0
                            ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.anota![index].title!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.anota![index].anotacao!,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              );
            },
          ),
        ),

          IconButton(
            onPressed: add,
            icon: Icon(widget.newNote == true ? Icons.save : Icons.add),
            color: Colors.blue,
          ) 

      ],
    );
  }
}
