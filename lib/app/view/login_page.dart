import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_crud_postgre1/app/model/dao/postgre/conexao.dart';
import 'package:flutter_crud_postgre1/app/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Guarda os valores dos campos
  String login = '';
  String senha = '';

  //Metodo para Separado Body do Scaffold
  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        //pegar as dimeções ta tela:
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Separador
              Container(height: 40),

              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //Separador
              Container(height: 30),

              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
                  child: Column(
                    children: [
                      //Campo Login : aceita user ou e-mail
                      TextField(
                        //Definir o tipo de teclado
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Login',
                          border: OutlineInputBorder(),
                        ),
                        //Pega o valor do campo:
                        onChanged: (text) {
                          //pode ser o email ou hash do usuario:
                          login = text;
                        },
                      ),

                      //Separador
                      Container(height: 20),

                      //Campo senha:
                      TextField(
                        //Ocultar senha:
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(),
                        ),
                        //Pega o valor do campo:
                        onChanged: (text) {
                          senha = text;
                        },
                      ),

                      //Separador
                      Container(height: 20),

                      //Botão Entrar
                      ElevatedButton(
                        style: ButtonStyle(
                          //Cor de fundo do botão
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        //Evento ao pressionar:
                        onPressed: () {
                          //Faz a validação do login:
                          if (login.isEmpty && senha.isEmpty) {
                            print('Campo login ou senha nao podem ser vazios!');
                            return;
                          }
                          //Sucesso!
                          if (login == 'als' ||
                              login == 'als@teste.com' && senha == '123') {
                            print('Parabens voce logou!');

                            //Carrega  tela nomeada:
                            Navigator.of(context).pushNamed(AppRoutes.HOME);
                          } else {
                            print('Senha ou email inválidos!');
                            return;
                          }
                        },
                        //botão estendido até a largura do seu widget pai
                        child: Container(
                            width: double.infinity,
                            //Texto alinhado ao centro
                            child: Text('Entrar', textAlign: TextAlign.center)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Stack - sobrepoe widgets
      body: Stack(children: [
        SizedBox(
            //definir a imagem na largura total de tela
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/background.jpg',
                //ajusta imagem na altura tela
                fit: BoxFit.cover)),
        //Cria uma mascara para escurecer a imagem:
        Container(color: Colors.blue.withOpacity(0.50)),
        _body(),
      ]),
    );
  }
}
