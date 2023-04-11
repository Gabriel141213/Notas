import 'package:flutter/material.dart';

class TextFormat extends StatefulWidget {
  String label = '';
  var controller = TextEditingController();

  TextFormat(this.label, this.controller, {super.key});

  @override
  State<TextFormat> createState() => _TextFormatState();
}

class _TextFormatState extends State<TextFormat> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
              labelText: widget.label,
              isDense: true,
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              
              ),
              ),
    );
  }
}