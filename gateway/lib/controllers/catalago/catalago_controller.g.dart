// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalago_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$CatalagoControllerRouter(CatalagoController service) {
  final router = Router();
  router.add('GET', r'/', service.obterTodosVeiculos);
  router.add('POST', r'/', service.cadastrarVeiculo);
  router.add('GET', r'/modelos', service.obterTodosModelos);
  return router;
}
