# Projeto educacional de uma aplicação para uma agência de veículos



## Regras do exercício:

* Construir um sistema para uma agência de veículos no qual será composto por uma api e um frontend (Desktop ou Mobile)
* O sistema recisa ser capaz de:
    * Cadastrar a compra de um veículo com os detalhes de modelo, marca, ano de fabricação, placa, cor, chassi, data da compra e valor da compra
    * Registrar a venda de um veículo com os detalhes de data da venda, valor da venda e comissão do vendedor (10% sobre o lucro da venda)
    * Deverá ser possível listar todos os veículos, veículos disponíveis e histórico de veículos vendidos
    * Listar o valor total em compras e vendas, lucro/prejuízo do mês e o valor pago em comissões


## Considerações na resolução do exercíco
* O Dart foi a linguagem escolhida para ser usada no desenvolvimento do backend como do fronted. Acredito que o uso de uma única linguagem para todo o projeto pode gerar custo menor e uma agilidade maior no desenvolvimento do mesmo. Como framework eu usei o Flutter para um desenvolvimento cross platform, podendo assim gerar um build do frontend para mobile nativo ou web nativo e podendo até gerar um versão desktop para agência. 
* O projeto está dividido na seguintes partes:
    * app -> Responsável pelo desenvolvimento do frontend
    * services -> Responsável pelo desenvolvimento de três contextos do projeto, sendo eles: catálago, venda e relatório. O objetivo dessa divisão é já iniciar uma visão de arquitetura para microserviço, podendo no futuro trabalhar com CQRS, Mensageria e outros padrões necessários para ganhar escala.
    * gateway -> Responsável pelo backend e com a comunicação com os contextos do projeto. Essa comunicação é feita por injeção de dependência, porém pode ser feita com comunicação entre API ou com gRPC.
    * core -> Responsável pelo compartilhamento de recursos entre os contextos do projeto. 
* Para o banco de dados eu usei o mysql, porém não tem um relacionamento através de chaves estrangeiras pois foi pensando no isolamento do banco de escrita entre os contextos (services). 



## Passos para fazer a aplicação rodar

1. Subir o **banco**
    1. O arquivo docker-compose tem as configurações do mysql e apontamento para um script sql com dados de criação do esquema de dados. Seguindo com o **comando: `docker-compose up`
    2. Todos os apontamento dos projeto está para o localhost e para a **porta 3306**. O usuário é `root` e a senha é `root123`
    obs: configurações do banco está no arquivo \services\core\lib\database\mysql\database_connection.dart
2. Subir a aplicação do **frontend (web)** com o dockerfile
    1. O arquivo dockerfile-front-web vai buildar o projeto para rodar web e subir uma imagem do nginx
    2. Seguindo com os **comandos**
        * `docker build -t img-centercar-web . -f dockerfile-front-web`
        * `docker run -it -p 4545:80 --name centercar-web --rm img-centercar-web`
    obs: A aplicação vai rodar no **localhost:4545**
3. Subir a aplicação do **backend (API)** com o dockerfile
    1. o arquivo dockerfile-gateway vai buildar o compilar o projeto em AOT em uma imagem maior e por fim passar para uma imagem pequena de 11mb para ser escalado :) Podendo assim ser uma ótima opção para criar aplicações no backend
    2. Seguindo com os **comandos**
        * `docker build --progress=plain -t img-centercar-gateway . -f dockerfile-gateway`
        * `docker run -it -p 8080:8080 --name centercar-gateway --rm img-centercar-gateway`
    obs: O apontamento da aplicação do frontend está comunicação com a API usando o **meu IP junto a porta 8080** e vai ser preciso ser alterado o arquivo ("\app\lib\helpers\rest_client.dart") para o IP da rede que for rodar a API. 

**O arquivo `experiência de uso da aplicação mobile.rar` contém a gravação em tela da aplicação rodando no mobile**

