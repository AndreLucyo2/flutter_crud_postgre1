//Query qye cria a estrutura do banco:
class QueryCreateDB {
  static String queryDb = """
    CREATE TABLE IF NOT EXISTS tb_user 
    (
      id INTEGER PRIMARY KEY,
      nome varchar(45) NOT NULL,
      email varchar(45) NOT NULL,
      senha varchar(45) NOT NULL,
      hashUser varchar(45)
    );""";
}
