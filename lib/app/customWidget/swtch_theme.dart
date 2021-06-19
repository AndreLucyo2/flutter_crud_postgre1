import 'package:flutter/material.dart';
import 'package:flutter_crud_postgre1/app/view_controller/app_controller.dart';

//Retorna um Widget customizado
class SwtchTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      //Seta o valor da variavel do controller:
      value: AppController.getInstancia.isDarkTheme,
      onChanged: (value) {
        //Executa o metodo para alternar o thema:
        AppController.getInstancia.alternarThema();
      },
    );
  }
}
