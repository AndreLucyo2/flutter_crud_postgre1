import 'package:postgres/postgres.dart';

class Conexao {
  //inicializa a conexao:
  static PostgreSQLConnection _conexaoPostgreSQL = new PostgreSQLConnection(
    "",
    0,
    "",
  );

  static Future<PostgreSQLConnection> getConexao() async {
    //Teste se a conexção esta fechada ou com valor inicial:
    if (_conexaoPostgreSQL == PostgreSQLConnection("", 0, "") ||
        _conexaoPostgreSQL.isClosed) {
      _conexaoPostgreSQL = new PostgreSQLConnection(
        "192.168.1.120",
        5432,
        "bdCRUD_App_flutter",
        username: "postgres",
        password: "12345678",
      );
      await _conexaoPostgreSQL.open();
      await _conexaoPostgreSQL.execute("set tcp_keepalives_idle = 30;");
      await _conexaoPostgreSQL.execute("set tcp_keepalives_interval = 15;");
      await _conexaoPostgreSQL.execute("set tcp_keepalives_count = 10;");
    }
    return _conexaoPostgreSQL;
  }

  static Future<bool> testeConnection() async {
    PostgreSQLConnection conexao = await Conexao.getConexao();

    if (conexao.isClosed) {
      print("Conexao fechada!");
      return false;
    } else {
      print("Conexao aberta!");
      return true;
    }
  }
}
