import 'package:flutter/material.dart';
import 'package:flutter_crud_postgre1/app/model/dao/postgre/conexao.dart';
import 'package:flutter_crud_postgre1/app/view/app_widget.dart';

main() {
  //Teste de conexao:
  Conexao.testeConnection();

  //Ver canal Fluterando:
  runApp(AppWidget());
}
