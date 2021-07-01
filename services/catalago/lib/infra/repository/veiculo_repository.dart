import 'package:catalago/domain/iveiculo_repository.dart';
import 'package:catalago/domain/modelo.dart';
import 'package:catalago/domain/veiculo.dart';
import 'package:core/database/mysql/i_database_connection.dart';
import 'package:mysql1/mysql1.dart';

class VeiculoRepository implements IVeiculoRepository {
  IDatabaseConnection connection;

  VeiculoRepository({
    required this.connection,
  });

  @override
  Future<List<Veiculo>> obterTodos() async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        SELECT 
            veiculo.*,
            modelo.nome AS modelo_nome,
            modelo.marca AS modelo_marca,
            modelo.ano AS modelo_ano,
            modelo.cor AS modelo_cor,
            modelo.estoque AS modelo_estoque,
            venda.data AS data_venda,
            venda.valor AS venda_valor
        FROM
            `centercar`.`veiculo`
                INNER JOIN
            `centercar`.`modelo` ON veiculo.modelo_id = modelo.id
        		    LEFT JOIN
        	  `centercar`.`venda` ON veiculo.id = venda.veiculo_id;
      ''';

      final result = await conn.query(query);

      if (result.isNotEmpty) {
        return result
            .map(
              (e) => Veiculo(
                  chassi: e['chassi'],
                  data_compra: e['data_compra'],
                  modelo: Modelo(
                      nome: e['modelo_nome'],
                      id: e['modelo_id'],
                      marca: e['modelo_marca'],
                      ano: e['modelo_ano'],
                      cor: e['modelo_cor'],
                      estoque: e['modelo_estoque']),
                  placa: e['placa'],
                  valor: e['valor'],
                  id: e['id'],
                  data_venda: e['data_venda']),
            )
            .toList();
      }

      return [];
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<List<Modelo>> obterTodosModelos() async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = 'SELECT * FROM `centercar`.`modelo`;';

      final result = await conn.query(query);

      if (result.isNotEmpty) {
        return result
            .map(
              (e) => Modelo(
                  id: e['id'],
                  nome: e['nome'],
                  marca: e['marca'],
                  ano: e['ano'],
                  cor: e['cor'],
                  estoque: e['estoque']),
            )
            .toList();
      }

      return [];
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<Modelo> obterModeloPorId(String id) async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = 'SELECT * FROM `centercar`.`modelo` WHERE id = ?;';

      final result = await conn.query(query, [id]);

      if (result.isNotEmpty) {
        final e = result.first;
        return Modelo(
            nome: e['nome'],
            id: e['id'],
            marca: e['marca'],
            ano: e['ano'],
            cor: e['cor'],
            estoque: e['estoque']);
      }

      throw UnimplementedError();
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<Veiculo> obterVeiculoPorId(String id) async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
		    SELECT 
            veiculo.*,
            modelo.nome as modelo_nome,
            modelo.marca as modelo_marca,
            modelo.ano as modelo_ano,
            modelo.cor as modelo_cor,
            modelo.estoque as modelo_estoque
        FROM
        `centercar`.`veiculo`
            INNER JOIN
        `centercar`.`modelo` ON veiculo.modelo_id = modelo.id where veiculo.id = ?
      ''';

      final result = await conn.query(query, [id]);

      if (result.isNotEmpty) {
        final e = result.first;
        return Veiculo(
            chassi: e['chassi'],
            data_compra: e['data_compra'],
            modelo: Modelo(
                nome: e['modelo_nome'],
                id: e['modelo_id'],
                marca: e['modelo_marca'],
                ano: e['modelo_ano'],
                cor: e['modelo_cor'],
                estoque: e['modelo_estoque']),
            placa: e['placa'],
            valor: e['valor'],
            id: e['id'],
            data_venda: e['data_venda']);
      }

      throw UnimplementedError();
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }

  @override
  Future<void> adicionarVeiculo(Veiculo veiculo) async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();

      final query = '''
        INSERT INTO `centercar`.`veiculo`
          (`id`,
          `modelo_id`,
          `placa`,
          `chassi`,
          `valor`,
          `data_compra`)
        VALUES (?,?,?,?,?,?);
      ''';

      final result = await conn.query(query, [
        veiculo.id,
        veiculo.modelo.id,
        veiculo.placa,
        veiculo.chassi,
        veiculo.valor,
        veiculo.data_compra.toString()
      ]);
    } on MySqlException catch (e) {
      throw UnimplementedError();
    } finally {
      await conn?.close();
    }
  }

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
}
