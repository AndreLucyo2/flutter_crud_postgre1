import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_postgre1/app/routes/app_routes.dart';
import 'package:flutter_crud_postgre1/app/view/home_page.dart';
import 'package:flutter_crud_postgre1/app/view/login_page.dart';
import 'package:flutter_crud_postgre1/app/view_controller/app_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //fica escutando as alterações re faz rebuild do Widget
    return AnimatedBuilder(
      animation: AppController.getInstancia,
      builder: (context, child) {
        return MaterialApp(
          //tirar selo debug
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            //Aplicar uma condição para alternar thema: Aplicar um if ternario
            brightness: AppController.getInstancia.isDarkTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          //Definir a rota inicial
          initialRoute: AppRoutes.MAIN,
          //Definir as rotas nomeadas
          routes: {
            AppRoutes.MAIN: (context) => LoginPage(),
            AppRoutes.HOME: (context) => HomePage(),
            AppRoutes.LOG_IN: (context) => LoginPage(),
          },
        );
      },
    );
  }
}
