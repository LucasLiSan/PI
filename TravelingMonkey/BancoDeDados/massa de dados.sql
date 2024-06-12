use travelingmonkey;
#drop database travelingmonkey;
select * from pontos;
select * from feedbackpontos;

ALTER TABLE feedbackpontos
ADD CONSTRAINT FK_idPontoAvaliado
FOREIGN KEY (idPontoAvaliado) REFERENCES pontos(id);

INSERT INTO horarioFuncionas (diaDaSemana, situacao, horaAbre, horaAlmocoIda, horaAlmocoVolta, horaFecha) VALUES
('Segunda-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Terça-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Quarta-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Quinta-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Sexta-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Sábado', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Domingo', 'Fechado', NULL, NULL, NULL, NULL),
('Segunda-feira', 'Fechado', NULL, NULL, NULL, NULL),
('Terça-feira', 'Fechado', NULL, NULL, NULL, NULL),
('Quarta-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Quinta-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Sexta-feira', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Sábado', 'Aberto', '08:00:00', '12:00:00', '13:00:00', '18:00:00'),
('Domingo', 'Fechado', NULL, NULL, NULL, NULL);

INSERT INTO horarioXpontos (idHorario, idPontoTuristico) VALUES
(1, 1),(2, 1),(3, 1),(4, 1),(5, 1),(6, 1),(7, 1),
(1, 2),(2, 2),(3, 2),(4, 2),(5, 2),(6, 2),(7, 2),
(1, 3),(2, 3),(3, 3),(4, 3),(5, 3),(6, 3),(7, 3),
(1, 4),(2, 4),(3, 4),(4, 4),(5, 4),(6, 4),(7, 4),
(1, 5),(2, 5),(3, 5),(4, 5),(5, 5),(6, 5),(7, 5),
(1, 6),(2, 6),(3, 6),(4, 6),(5, 6),(6, 6),(7, 6),
(1, 7),(2, 7),(3, 7),(4, 7),(5, 7),(6, 7),(7, 7),
(1, 8),(2, 8),(3, 8),(4, 8),(5, 8),(6, 8),(7, 8),
(1, 9),(2, 9),(3, 9),(4, 9),(5, 9),(6, 9),(7, 9),
(1, 10),(2, 10),(3, 10),(4, 10),(5, 10),(6, 10),(7, 10),
(8,11),(9,11),(10,11),(11,11),(12,11),(13,11),(14,11),
(8,12),(9,12),(10,12),(11,12),(12,12),(13,12),(14,12),
(8,13),(9,13),(10,13),(11,13),(12,13),(13,13),(14,13);

INSERT INTO pontos (nomePonto, modalidade, valorEntrada, endRuaPonto, endBairroPonto, endNumPonto, endCidadePonto, endUfPonto, endCepPonto, endReferenciaPonto, endGeoLatPonto, endGeoLongePonto, profilePicPonto) VALUES
('Parque Estadual Turístico do Alto Ribeira (PETAR)', 22, 30.00, 'Estrada do Ouro Grosso', 'Iporanga', 's/n', 'Iporanga', 'SP', '18330-000', 'Próximo ao bairro da Serra', -24.5275, -48.6825, '/imgs/profilePics/petar.jpg'),
('Caverna do Diabo', 41, 50.00, 'Rodovia SP-165', 'Eldorado', 'km 111', 'Eldorado', 'SP', '11960-000', 'Próximo ao Parque Estadual Caverna do Diabo', -24.6467, -48.4083, '/imgs/profilePics/caverna_diabo.jpg'),
('Ilha do Cardoso', 18, 0.00, 'Acesso por barco', 'Cananéia', '', 'Cananéia', 'SP', '11990-000', 'Saída do Porto de Cananéia', -25.0253, -47.9208, '/imgs/profilePics/ilha_cardoso.jpg'),
('Reserva Legado das Águas', 22, 40.00, 'Rodovia SP-079', 'Tapiraí', 'km 122', 'Miracatu', 'SP', '11850-000', 'Acesso pela Rodovia Régis Bittencourt', -24.2775, -47.5083, '/imgs/profilePics/legado_aguas.jpg'),
('Parque Estadual Ilha do Cardoso', 22, 0.00, 'Ilha do Cardoso', 'Cananéia', '', 'Cananéia', 'SP', '11990-000', 'Acesso por barco a partir de Cananéia', -25.0270, -47.9156, '/imgs/profilePics/parque_ilha_cardoso.jpg'),
('Centro Histórico de Iguape', 1, 0.00, 'Rua Major Rebelo', 'Centro', 's/n', 'Iguape', 'SP', '11920-000', 'Próximo à Praça da Basílica', -24.6980, -47.5538, '/imgs/profilePics/centro_historico_iguape.jpg'),
('Quilombo Ivaporunduva', 5, 10.00, 'Estrada Municipal', 'Iporanga', 's/n', 'Iporanga', 'SP', '18330-000', 'Próximo ao Rio Ribeira de Iguape', -24.5142, -48.5950, '/imgs/profilePics/quilombo_ivaporunduva.jpg'),
('Cachoeira do Meu Deus', 21, 0.00, 'Estrada do Bairro da Serra', 'Iporanga', 's/n', 'Iporanga', 'SP', '18330-000', 'Dentro do PETAR', -24.5300, -48.7050, '/imgs/profilePics/cachoeira_meu_deus.jpg'),
('Museu Histórico e Arqueológico de Iguape', 2, 0.00, 'Rua XV de Novembro', 'Centro', 's/n', 'Iguape', 'SP', '11920-000', 'Próximo à Praça da Basílica', -24.6985, -47.5533, '/imgs/profilePics/museu_iguape.jpg'),
('Mirante do Morro do Espia', 21, 0.00, 'Morro do Espia', 'Centro', 's/n', 'Cananéia', 'SP', '11990-000', 'Acesso por trilha', -25.0150, -47.9275, '/imgs/profilePics/mirante_morro_espia.jpg'),
('Cachoeira da Usina', 21, 0.00, 'Estrada da Usina', 'Centro', 's/n', 'Registro', 'SP', '11900-000', 'Próximo à Usina Hidrelétrica', -24.4953, -47.8438, '/imgs/profilePics/cachoeira_usina.jpg'),
('Parque Turístico Rocha do Itapu', 22, 10.00, 'Estrada do Turvo', 'Jardim Caiçara', 's/n', 'Registro', 'SP', '11900-000', 'Próximo à Serra do Mar', -24.4987, -47.8332, '/imgs/profilePics/parque_rocha_itapu.jpg'),
('Praia do Meio', 18, 0.00, 'Avenida Beira-Mar', 'Vila Nova', 's/n', 'Registro', 'SP', '11900-000', 'Próximo à Ponte Tancredo Neves', -24.4921, -47.8269, '/imgs/profilePics/praia_meio.jpg');

SELECT 
    pontos.nomePonto,
    horarioFuncionas.diaDaSemana,
    horarioFuncionas.situacao,
    horarioFuncionas.horaAbre,
    horarioFuncionas.horaAlmocoIda,
    horarioFuncionas.horaAlmocoVolta,
    horarioFuncionas.horaFecha
FROM 
    pontos
JOIN 
    horarioXpontos ON pontos.id = horarioXpontos.idPontoTuristico
JOIN 
    horarioFuncionas ON horarioXpontos.idHorario = horarioFuncionas.id;

SELECT 
    pontos.nomePonto,
    cidades.nomeCidade
FROM 
    pontos
JOIN 
    cidades ON pontos.endCidadePonto = cidades.nomeCidade;

SELECT 
    pontos.nomePonto,
    cidades.nomeCidade
FROM 
    pontos
JOIN 
    cidades ON pontos.endCidadePonto = cidades.nomeCidade;

select * from categoriasxpontos;

INSERT INTO categoriasxpontos (modalidade, categoria) VALUES
('Locais históricos', 'Cultura'),
('Museus e galerias de arte', 'Cultura'),
('Eventos culturais', 'Cultura'),
('Arte pública', 'Cultura'),
('Comunidades étnicas', 'Cultura'),
('Turismo industrial', 'Cultura'),
('Turismo criativo', 'Cultura'),
('Edifícios e estruturas', 'Arquitetura'),
('Castelos e fortes', 'Arquitetura'),
('Templos antigos', 'Arquitetura'),
('Pontes e arranha-céus', 'Arquitetura'),
('Restaurantes e bares', 'Gastronomia'),
('Feiras e mercados', 'Gastronomia'),
('Eventos gastronômicos', 'Gastronomia'),
('Parques temáticos', 'Infraestrutura'),
('Parques aquáticos', 'Infraestrutura'),
('Carnavais', 'Infraestrutura'),
('Praias', 'Paisagem'),
('Montanhas', 'Paisagem'),
('Desertos', 'Paisagem'),
('Florestas', 'Paisagem'),
('Parques nacionais', 'Paisagem'),
('Jardins botânicos', 'Paisagem'),
('Eventos esportivos', 'Eventos'),
('Corrida de Fórmula 1', 'Eventos'),
('Regatas de vela', 'Eventos'),
('Centros comerciais', 'Compras'),
('Feiras de artesanato', 'Compras'),
('Mercados de rua', 'Compras'),
('Lojas de fábrica', 'Compras'),
('Trens históricos', 'Cultura'),
('Zoológicos', 'Infraestrutura'),
('Aquários', 'Infraestrutura'),
('Bibliotecas', 'Infraestrutura'),
('Antigas prisões', 'Infraestrutura'),
('Museus de história viva', 'Infraestrutura'),
('Oficinas de artesanato', 'Cultura'),
('Shows e concertos', 'Eventos'),
('Feiras e exposições', 'Eventos'),
('Eventos religiosos', 'Eventos'),
('Caverna', 'Ecoturismo');

select * from comentAvalia;

INSERT INTO avaliacoespontos (idAvaliador, idPontoAvaliado, nota, comentario, dataAvaliacao) VALUES
(1, 1, 5, 'Ótimo lugar, muito bem conservado e com guias excelentes.', '2024-01-15'),
(1, 2, 4, 'Experiência incrível, mas o acesso poderia ser melhor.', '2024-02-10'),
(1, 3, 5, 'Maravilhoso! Perfeito para quem gosta de natureza.', '2024-03-05'),
(1, 4, 3, 'Bom, mas esperava mais das instalações.', '2024-04-20'),
(1, 5, 4, 'Ótimo passeio de barco, recomendo!', '2024-05-14'),
(1, 6, 5, 'História fascinante e bem preservada.', '2024-06-11'),
(1, 7, 4, 'Cultura rica e guias bem informados.', '2024-07-08'),
(1, 8, 5, 'Cachoeira incrível, vale cada minuto!', '2024-08-21'),
(1, 9, 4, 'Museu interessante, mas poderia ser maior.', '2024-09-17'),
(1, 10, 5, 'Vista espetacular, acesso por trilha é um plus.', '2024-10-04'),
(1, 11, 3, 'Lugar bonito, mas a manutenção deixa a desejar.', '2024-11-13'),
(1, 12, 4, 'Parque muito agradável, ótima opção de lazer.', '2024-12-01'),
(1, 13, 5, 'Praia tranquila e limpa, recomendo!', '2024-12-21');

select * from avaliacaoXavaliados;

INSERT INTO pontosavaliados (idAvaliacao, idPonto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13);

DESCRIBE pontos;

