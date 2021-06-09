--Criar Clientes--------------------------------------

CREATE (c1:Cliente{nome: "Charyl Mattiuzzi", 
				   cpf: "329.396.620-96", 
				   telefone: "(26)961590-0348", 
				   dataCadastro: "01/01/2021", 
				   dataUpdate: "", 
				   tipoCliente: "Associado", 
				   status: "Ativo"})

CREATE (c2:Cliente{nome: "Pat Durran", 
				   cpf: "437.106.790-52", 
				   telefone: "(21)975647-3369", 
				   dataCadastro: "01/01/2021", 
				   dataUpdate: "", 
				   tipoCliente: "Comum", 
				   status: "Ativo"})				   

CREATE (GrethelKlawi:Cliente{nome: "Grethel Klawi", 
				   cpf: "506.599.820-56", 
				   telefone: "(37)975898-9631", 
				   dataCadastro: "03/01/2021", 
				   dataUpdate: "", 
				   tipoCliente: "Associado", 
				   status: "Ativo"})

CREATE (RogerioCassey:Cliente{nome: "Rogerio Cassey", 
				   cpf: "845.248.660-00", 
				   telefone: "(70)973070-1367", 
				   dataCadastro: "04/01/2021", 
				   dataUpdate: "31/01/2021", 
				   tipoCliente: "Comum", 
				   status: "Ativo"})		
				   
CREATE (c5:Cliente{nome: "Bessy Dubbin", 
				   cpf: "032.360.380-71", 
				   telefone: "(77)961861-9737", 
				   dataCadastro: "05/01/2021", 
				   dataUpdate: "12/01/2021", 
				   tipoCliente: "Comum", 
				   status: "Ativo"})
				   
--Criar Livros----------------------------------------

CREATE (l1:Livro{titulo: "A Divina Comédia", 
				 autor: "Dante Alighieri", 
				 editora: "Principis", 
				 ano: 2020,
				 genero: "Comédia",
				 quantidade: 30,
				 dataCadastro: "01/01/2021", 
				 dataUpdate: "", 
				 codigoDeBarras: "123456789012", 
				 status: "Ativo"})
				 
CREATE (l2:Livro{titulo: "Romeu e Julieta", 
				 autor: "William Shakespeare", 
				 editora: "Martin Claret", 
				 ano: 2002,
				 genero: "Drama",
				 quantidade: 30,
				 dataCadastro: "01/01/2021", 
				 dataUpdate: "", 
				 codigoDeBarras: "555444332221", 
				 status: "Ativo"})

CREATE (l3:Livro{titulo: "A república", 
				 autor: "platão", 
				 editora: "Martin Claret", 
				 ano: 2010,
				 genero: "Filosofia",
				 quantidade: 20,
				 dataCadastro: "01/01/2021", 
				 dataUpdate: "", 
				 codigoDeBarras: "568754456745", 
				 status: "Ativo"})
				 
CREATE (l4:Livro{titulo: "Riqueza das Nações", 
				 autor: "Adam Smith", 
				 editora: "Ediouro", 
				 ano: 2020,
				 genero: "Filosofia",
				 quantidade: 35,
				 dataCadastro: "01/01/2021", 
				 dataUpdate: "", 
				 codigoDeBarras: "416512563125", 
				 status: "Ativo"})
				 
CREATE (l5:Livro{titulo: "Odisséia", 
				 autor: "Homero", 
				 editora: "Rideel", 
				 ano: 2020,
				 genero: "Épico",
				 quantidade: 40,
				 dataCadastro: "01/01/2021", 
				 dataUpdate: "12/01/2021", 
				 codigoDeBarras: "569874214568", 
				 status: "Ativo"})
				 
--Criar aluguel 1 ---------------------------------------------------------------

MATCH (cliente:Cliente), (livro1:Livro), (livro2:Livro)
WHERE cliente.nome = "Charyl Mattiuzzi" AND 
	  livro1.titulo = "A Divina Comédia" AND 
	  livro2.titulo = "Odisséia"
CREATE(a1:Aluguel {dataAluguel: "01/01/2021",
			       dataDevolucaoPrevista: "08/01/2021",
				   dataDevolucao: "08/01/2021",
				   valorAluguel: 10,
				   multaAtraso: 0,
				   multaDeterioracao: 0,
				   desconto: 0,
				   valorTotal: 10,
				   status: "Desativado"})
CREATE
(cliente)-[:Fez_aluguel {tipoCliente: [cliente.tipoCliente]}]->(a1),
(a1)-[:Possui_o_livro {quantidade: 2}]->(livro1),
(a1)-[:Possui_o_livro {quantidade: 1}]->(livro2)

--Criar aluguel 2 ---------------------------------------------------------------

MATCH (cliente:Cliente), (livro1:Livro), (livro2:Livro), (livro3:Livro)
WHERE cliente.nome = "Rogerio Cassey" AND 
	  livro1.titulo = "Riqueza das Nações" AND 
	  livro2.titulo = "A república"  AND
	  livro3.titulo = "A Divina Comédia"
CREATE(a2:Aluguel {dataAluguel: "01/01/2021",
			       dataDevolucaoPrevista: "08/01/2021",
				   dataDevolucao: null,
				   valorAluguel: 10,
				   multaAtraso: null,
				   multaDeterioracao: null,
				   desconto: null,
				   valorTotal: null,
				   status: "Ativo"})
CREATE
(cliente)-[:Fez_aluguel {tipoCliente: [cliente.tipoCliente]}]->(a2),
(a2)-[:Possui_o_livro {quantidade: 1}]->(livro1),
(a2)-[:Possui_o_livro {quantidade: 1}]->(livro2),
(a2)-[:Possui_o_livro {quantidade: 1}]->(livro3)

--Buscar aluguel ativo ---------------------------------------------------------------

MATCH (busca:Aluguel) 
WHERE busca.status = "Ativo" 
RETURN busca