import 'package:core/database/mysql/i_database_connection.dart';
import 'package:mysql1/mysql1.dart';
import 'package:venda/domain/ivenda_repository.dart';
import 'package:venda/domain/venda.dart';

class VendaRepository implements IVendaRepository {
  IDatabaseConnection connection;

  VendaRepository({
    required this.connection,
  });

  @override
  Future<void> atualizarEstoque(String id, int quantidade) async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        UPDATE `centercar`.`modelo`
        SET estoque = ?
        WHERE id = ?
      ''';

      final result = await conn.query(query, [quantidade, id]);
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> realizarVenda(Venda venda) async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        INSERT INTO `centercar`.`venda`
          (`id`,
          `data`,
          `veiculo_id`,
          `valor`,
          `comissao_vendedor`)
        VALUES (?,?,?,?,?);
      ''';

      final result = await conn.query(query, [
        venda.id,
        venda.data.toString(),
        venda.veiculo.id,
        venda.valor,
        venda.comissao_vendedor
      ]);
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }
}
