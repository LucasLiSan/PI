use travelingmonkey;

UPDATE `travelingmonkey`.`pontos` SET `nomePonto` = 'Parque Estadual Ilha do Cardoso', `modalidade` = '22', `valorEntrada` = '0', `endRuaPonto` = 'Rodovia SP-222', `endBairroPonto` = 'Pariquera-Açu', `endNumPonto` = '0', `endCidadePonto` = 'Pariquera-Açu', `endCepPonto` = '11930-000', `endReferenciaPonto` = 'Linha do Braço Magro', `endGeoLatPonto` = '-24.74809717932124', `endGeoLongePonto` = '-47.94910512717522', `profilePicPonto` = '/imgs/profilePics/casaDePedra.jpg' WHERE (`id` = '9');
UPDATE `travelingmonkey`.`pontos` SET `nomePonto` = 'Cachoeira do Exorcismo', `modalidade` = '42', `valorEntrada` = '0', `endRuaPonto` = 'Rodovia SP-222', `endBairroPonto` = 'Pariquera-Açu', `endNumPonto` = '0', `endCidadePonto` = 'Pariquera-Açu', `endCepPonto` = '11930-000', `endReferenciaPonto` = 'Linha do Braço Magro', `endGeoLatPonto` = '-24.74809717932124', `endGeoLongePonto` = '-47.94910512717522', `profilePicPonto` = '/imgs/profilePics/cachoeiraDoExorcismo.jpg' WHERE (`id` = '10');


select * from avaliacoesguias;
select * from avaliacoespontos;
select * from categoriasxpontos;
select * from cidades;

select * from comodidades;
select * from comodidadesxpontos;
select * from fotosguias;
select * from fotospontos;
select * from fotosxpontofotografados;
select * from guias;
select * from guiasavaliados;
select * from horariofuncionas;
select * from horarioxpontos;
select * from pontos;
select * from pontosavaliados;
select * from turistas;

DELETE FROM avaliacoespontos WHERE id=11;
DELETE FROM avaliacoespontos WHERE id=12;
DELETE FROM avaliacoespontos WHERE id=13;
DELETE FROM avaliacoespontos WHERE id=14;
DELETE FROM avaliacoespontos WHERE id=15;

select * from cidadesxpontos;
DELETE FROM cidadesxpontos WHERE idCidade=3;
DELETE FROM cidadesxpontos WHERE idCidade=4;
DELETE FROM cidadesxpontos WHERE idCidade=7;
DELETE FROM cidadesxpontos WHERE idCidade=8;


DELETE FROM cidades WHERE id=8;
DELETE FROM pontos WHERE id=12;
DELETE FROM pontos WHERE id=13;
DELETE FROM pontos WHERE id=14;
DELETE FROM pontos WHERE id=15;

select * from pontos;
select * from cidades;
insert into cidadesxpontos (idCidade,idPonto) values 
(9,6), (9,7), (9,8),
(10,9), (10,10);