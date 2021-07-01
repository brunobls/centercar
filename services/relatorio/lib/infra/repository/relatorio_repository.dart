import 'package:core/database/mysql/i_database_connection.dart';
import 'package:mysql1/mysql1.dart';
import 'package:relatorio/business/indicadores.dart';
import 'package:relatorio/business/irelatorio_repository.dart';

class RelatorioRepository implements IRelatorioRepository {
  IDatabaseConnection connection;

  RelatorioRepository({
    required this.connection,
  });

  @override
  Future<Indicadores> obterIndicadores() async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        SELECT 
            *,
            (valor_total_em_vendas - (valor_total_em_compras + valor_pago_em_comissao)) AS lucro_ou_prejuizo
        FROM
            (SELECT 
                (SELECT 
                            ifnull(SUM(valor), 0.0)
                        FROM
                            `centercar`.`veiculo`) AS valor_total_em_compras,
                    (SELECT 
                            ifnull(SUM(valor), 0.0)
                        FROM
                            `centercar`.`venda`) AS valor_total_em_vendas,
                    (SELECT 
                            ifnull(SUM(comissao_vendedor), 0.0)
                        FROM
                            `centercar`.`venda`) AS valor_pago_em_comissao
            ) AS bruto;
      ''';

      final result = await conn.query(query);

      if (result.isNotEmpty) {
        final e = result.first;
        return Indicadores(
            valor_total_em_compras: e['valor_total_em_compras'] ?? 0.0,
            valor_total_em_vendas: e['valor_total_em_vendas'] ?? 0.0,
            lucro_ou_prejuizo: e['lucro_ou_prejuizo'] ?? 0.0,
            valor_pago_em_comissao: e['valor_pago_em_comissao'] ?? 0.0);
      }

      throw UnimplementedError();
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }
}
