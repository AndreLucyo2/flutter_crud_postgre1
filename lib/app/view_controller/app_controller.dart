import 'package:flutter/cupertino.dart';

//Gerencia de estado: aplica o Listeners
class AppController extends ChangeNotifier {
  //Usando padrao singleton: usa sempre a mesma instancia
  static AppController getInstancia = AppController();

  //pega o valor para mudar o estado:
  bool isDarkTheme = false;

  //Metodo para alterar a variavel a aplicar thema
  alternarThema() {
    //o ! alterna emtre false e true
    isDarkTheme = !isDarkTheme;

    //Notifica quem tiver escutando
    notifyListeners();
  }
}
