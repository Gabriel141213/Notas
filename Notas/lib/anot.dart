import 'package:flutter/material.dart';

class Anot {
  String? title;
  String? anotacao;
  Color? cor;

  Anot({this.title, this.anotacao, this.cor});

  Anot.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    anotacao = json['anotacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['anotacao'] = anotacao;
    return data;
  }
}
