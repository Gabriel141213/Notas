import 'package:flutter/material.dart';

class Caixa extends StatefulWidget {
  Color cor = Colors.red;
  bool done = false;
  Caixa(this.cor, this.done);

  @override
  State<Caixa> createState() => _CaixaState();
}

class _CaixaState extends State<Caixa> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Checkbox(
                          value: widget.done,
                          onChanged: (value) {
                            setState(() {
                              widget.done = !widget.done;
                            });
                          }),
                      Container(
                        height: 15,
                        width: 15,
                        color: widget.cor,
                      ),

                    ],
                  )
                ],
              );
  }
}