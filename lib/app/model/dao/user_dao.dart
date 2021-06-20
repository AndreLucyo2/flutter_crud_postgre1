import 'package:flutter_crud_postgre1/app/model/dao/postgre/conexao.dart';
import 'package:flutter_crud_postgre1/app/model/entidades/user.dart';
import 'package:postgres/postgres.dart';

class UserDAO {
  Future<bool> gravar(User user) async {
    bool sucesso = false;
    PostgreSQLConnection conexao = await Conexao.getConexao();

    await conexao.transaction((contexto) async {
      if (user.id <= 0) {
        await contexto.query("QueryInsert");
        sucesso = true;
      } else {
        await contexto.query("QueryUpdate");
        sucesso = true;
      }
    });

    //Se der erro:
    return sucesso;
  }

  Future<List<User>> pesquisar(String filtro) async {
    //Definir a conexão:
    PostgreSQLConnection conexao = await Conexao.getConexao();
    //retorna uma lista: Flutter 2.0 - Cria a lista fazia
    List<User> listObj = List.empty(growable: true);

    List<Map<String, Map<String, dynamic>>> results =
        await conexao.mappedResultsQuery("QuerySelect");
    //Percore o resultado e carrega a lista:
    for (final row in results) {
      //Objeto:
      User obj = User();

      obj.id = row['tb_user']!['id'];
    }
    return listObj;
  }
}
