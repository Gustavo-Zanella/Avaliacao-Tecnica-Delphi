# Avaliação Técnica - Delphi

Este é um teste técnico que foi desenvolvido para testar meus conhecimentos em Delphi e SQL.

### :large_orange_diamond: Descrição do problema
01- A Taif teve a brilhante ideia de lançar um carro chamado Marea, vendeu muito bem porém o carro acabou dando vários problemas para os donos, e a Taif como pensa nos clientes vai realizar um sorteio, o clientes que ganharem o sorteio ela vai dar um crédito de R$ 50,00 na compra do próximo carro, as regras do sorteio são:

- Apenas os 15 primeiros clientes ganham, por ordem da data da venda.
- Apenas clientes que o número de cpf comece com o dígito 0 podem concorrer.
- Apenas os clientes que compraram carros de data de lançamento de 2021 concorrem. 
- Se o cliente comprou dois carros do modelo Marea esta desclassificado.
- A empresa te contratou para realizar o desenvolvimento das consultas SQL do sorteio, abaixo está o esquema de tabela desenvolva as pesquisas:
---
### :large_orange_diamond: Pré-requisitos para execução
Antes de iniciar, você deve possuir:

- PostgreSQL 16: você pode instalar a partir de https://www.postgresql.org/download

---

### :large_orange_diamond: Stack de tecnologia
- Delphi 11: linguagem de programação utilizada no back-end.
- PostgreSQL 16: banco utilizado no back-end para armazenar os dados.

---

### :large_orange_diamond: Instalação
1. Clone o repositório:
   ```bash
   git clone https://github.com/Gustavo-Zanella/Avaliacao-Tecnica-Delphi.git
   ```

### :large_orange_diamond: Execução do Programa:
1. Configuração do Banco de Dados:
   ```bash
   - Abra seu Postgres
   - Copei os SQLs de Criação de Tabela, e os Execute
   ```
2. Configuração do Delphi:
   ```bash
   - Configure o aqruivo "Config.ini" com base nos dados do seu banco
   - Execute o Arquivo Taif.Exe -> Caminho: "Delphi/Win32/Debug"
   ```
---

### :large_orange_diamond: Funcionalidade:
1. Ao iniciar a aplicação será aberta a tela inicial, com o título "TAIF" e a ação "Cadastro"; 

2. Ao clicar no botão "Cadastro", será aberta a sobreposta "Cadastrar Cliente", com os campos obrigatórios "Nome", "CPF" e "Data de Nascimento";
	2.1. Quando um ou mais campos não tiverem o valor informado, ao clicar na ação "Cadastrar" ou ao remover o blur do campo em branco será emitido o alerta "Valor inválido"; 
	2.2. O campo "Data de Nascimento" não permite datas inválidas (Ex: 32/13/9999), caso seja informada uma data inválida será emitido o alerta "Valor inválido" e o campo será limpo;
	2.3. Não será possível fechar a sobreposta "Cadastrar Cliente" antes de cadastrar 5 clientes; 

3. Após cadastrar o 5° cliente, será aberta a sobreposta "Cadastrar Carro". Com os campos obrigatórios "Modelo" e "Data de Lançamento"; 
	3.1. Quando um ou mais campos não tiverem o valor informado, ao clicar na ação "Cadastrar" ou ao remover o blur do campo em branco será emitido o alerta "Valor inválido"; 
	3.2. O campo "Data de Lançamento" não permite datas inválidas (Ex: 32/13/9999), caso seja informada uma data inválida será emitido o alerta ""Valor inválido" e o campo será limpo;
	3.3. Não será possível fechar a sobreposta "Cadastrar Carro" antes de cadastrar 5 carros;

4. Após inserir o 5° carro será emitida a mensagem "Registros Inseridos com Sucesso"; 
	4.1. Ao clicar no botão "Ok" será retornada a tela inicial da aplicação; 
	4.2. Ao lado do botão "Cadastro", será exibida a tela de consulta com os 5 clientes inseridos relacionados aos 5 modelos de carro; 
		4.2.1. A tela de consulta possui as colunas "Venda" (código sequencial), "Data da Venda" (data atual), "Cliente", "CPF Cliente", "Modelo Carro" e "Lançamento do Modelo"; 
		
5. Ao clicar novamente no botão "Cadastrar" será possível inserir mais 5 clientes, mais 5 carros e mais 5 vendas;  
	

