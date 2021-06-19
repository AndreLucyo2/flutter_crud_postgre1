import 'package:flutter/material.dart';
import 'package:flutter_crud_postgre1/app/customWidget/swtch_theme.dart';
import 'package:flutter_crud_postgre1/app/routes/app_routes.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Andre Lucio da Silva'),
            accountEmail: Text('andre.lucyo2@gmail.com'),
            currentAccountPicture: ClipOval(
              child: Image.asset(
                'assets/images/userAvatar.png',
                fit: BoxFit.cover,
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                child: Text('Als'),
                backgroundColor: Colors.white60,
              ),
              CircleAvatar(
                child: Text('123'),
              ),
            ],
            onDetailsPressed: () {
              print('Detlhes do User.');
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text('Tela de inicio.'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
              print('Tela home');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            subtitle: Text('Perfil de usuario.'),
            onLongPress: () {
              print('Long ... Tela editar Profile');
            },
            onTap: () {
              print('Tela editar Profile');
            },
          ),
          ListTile(
            title: Text('Calls'),
            subtitle: Text('Calls.'),
            leading: Icon(Icons.call),
            onLongPress: () {},
          ),
          ListTile(
            title: Text('Support'),
            subtitle: Text('Suporte.'),
            leading: Icon(
              Icons.report_problem,
              color: Colors.red,
            ),
            onLongPress: () {},
          ),
          ListTile(
            leading: SwtchTheme(),
            title: Text('Config. Tema'),
            subtitle: Text('Tema Dark ou ligth'),
            onTap: () {
              print('Abre a tela configurações');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Login'),
            subtitle: Text('Teste de Tela de login'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.LOG_IN);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Login01'),
            subtitle: Text('Teste de nova tela'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.LOG_IN);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            subtitle: Text('Tela de configurações.'),
            onTap: () {
              print('Abre a tela configurações');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            subtitle: Text('Encerrar sessão.'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AppRoutes.MAIN);
            },
          ),
        ],
      ),
    );
  }
}
