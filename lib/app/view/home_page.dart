import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_postgre1/app/customWidget/drawer_home.dart';
import 'package:flutter_crud_postgre1/app/customWidget/swtch_theme.dart';

//----------------------------------------------------------------------
//Home page: pagina com estado
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

//----------------------------------------------------------------------
//Estado da pagina Home
class HomePageState extends State<HomePage> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Usa o componente customizado
      drawer: DrawerHome(),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          //Usa o componente customizado
          SwtchTheme(),
        ],
      ),
      body: Container(
        //pega toda a largura da tela
        width: double.infinity,
        //pega toda a altura da tela
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contagem $contador'),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(height: 30, width: 30, color: Colors.red),
                Container(height: 30, width: 30, color: Colors.green),
                Container(height: 30, width: 30, color: Colors.purple),
              ],
            ),
          ],
        ),
      ),

      //teste
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            //Modifica o estado da variavel: o setState refaz o Build
            setState(() {
              contador++;
            });
            print('Clicado no texto :$contador vezes!');
          }),
    );
  }
}
