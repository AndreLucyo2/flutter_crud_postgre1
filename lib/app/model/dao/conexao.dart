import 'package:postgres/postgres.dart';

class Conexao {
  static PostgreSQLConnection? _conexaoPostgreSQL;

  static Future<PostgreSQLConnection?> getConexao() async {
    //Teste se a conexção esta fechada ou nula:
    if (_conexaoPostgreSQL!.isClosed) {
      _conexaoPostgreSQL = new PostgreSQLConnection(
        "192.168.1.120",
        5432,
        "bdOrganicosApp",
        username: "postgres",
        password: "12345678",
      );
      //o ! valida e esta null
      await _conexaoPostgreSQL!.open();
      await _conexaoPostgreSQL!.execute("set tcp_keepalives_idle = 30;");
      await _conexaoPostgreSQL!.execute("set tcp_keepalives_interval = 15;");
      await _conexaoPostgreSQL!.execute("set tcp_keepalives_count = 10;");
    }
    return _conexaoPostgreSQL;
  }
}
