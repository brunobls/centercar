import 'package:mysql1/mysql1.dart';
import 'i_database_connection.dart';

class DatabaseConnection implements IDatabaseConnection {
  @override
  Future<MySqlConnection> openConnection() {
    return MySqlConnection.connect(ConnectionSettings(
      host: '192.168.15.3',
      port: 3306,
      user: 'root',
      password: 'root123',
      db: 'centercar',
    ));
  }
}
