/*
CONTROLLER PARA TRATAMENTO DOS DADOS DOS USUARIOS CADASTRADOS (CIDADES, GUIAS E TURISTAS) - CADASTRAR NOVO, DELETAR, UPDATE
Diferente do pontosController.js, esse é pra gerenciar os perfis de usuários criados no geral.
*/

/* \/---------- MODULES ----------\/ */
import express from "express";
import session from "express-session";
import { Op } from "sequelize";
import Auth from "../middleware/auth.js";
/* /\---------- MODULES ----------/\ */
/* \/---------- TABLES ----------\/ */
import Turistas from "../models/turistas.js";
import GuiasDeTurismo from "../models/guias.js";
import Cidades from "../models/cidades.js";
import PontosTuristicos from "../models/pontos.js";
import HorarioFuncionamento from "../models/horarioFunc.js";
import FotosPontos from "../models/fotosPontos.js";
import Atracoes from "../models/cidadesXpontos.js";
import PontosFotografados from "../models/fotosXPontoFotografados.js";
import CategoriasPontos from "../models/categoriaXponto.js";
import HorarioPonto from "../models/horarioXponto.js";
import "../models/associations.js";
/* /\---------- TABLES ----------/\ */
const router = express.Router();

function formatDate(date) {
    const d = new Date(date);
    const utcYear = d.getUTCFullYear();
    const utcMonth = String(d.getUTCMonth() + 1).padStart(2, '0');
    const utcDay = String(d.getUTCDate()).padStart(2, '0');
    return `${utcYear}-${utcMonth}-${utcDay}`;
}

/* \/---------- ROTAS PARA TRATAMENTO DAS INFORMAÇÕES DOS USUÁRIOS ----------\/ */
//CARREGAR INFORMAÇÕES
router.get("/profileUser", Auth, async (req, res) => {
    const user = req.session.userCidade || req.session.userGuia || req.session.userTurista;
    const loggedOut = !user;

    try {
        const pontosTuristicos = await PontosTuristicos.findAll({
            include: {
                model: HorarioFuncionamento,
                as: 'horarios' // Alias para os horários de funcionamento
            }
        });

        const atracoesCulturais = await Atracoes.findAll({
            where: { idCidade: user.id},
            include: {
                model: PontosTuristicos,
                as: 'atracoes'
            }
            
        });

        const fotosPontos = await FotosPontos.findAll({
            where: { idFotografo: user.id },
            include: {
                model: PontosTuristicos,
                as: 'pontoFotografado', // Alias usado na associação
            }
        });

        res.render("profileUser", {
            session: req.session,
            user: user,
            loggedOut: loggedOut,
            messages: req.flash(),
            PontosTuristicos: pontosTuristicos,
            FotosPontos: fotosPontos,
            atracoesCulturais : Atracoes
        });
    } catch (err) {
        console.error("Erro ao buscar Pontos Turisticos:", err);
        req.flash('danger', 'Erro ao carregar os pontos turísticos.');
        res.redirect("/profileUser");
    }
});

//APAGAR FOTOS
router.post("/profileUser/deleteFoto/:id", async (req, res) => {
    const id = req.params.id;

    try {
        await FotosPontos.destroy({
            where: { id: id }
        });
        req.flash('success', 'Foto deletada com sucesso.');
    } catch (err) {
        console.error("Erro ao deletar Foto:", err);
        req.flash('danger', 'Erro ao deletar a foto.');
    }
    res.redirect("/profileUser");
});
/* /\---------- ROTAS PARA TRATAMENTO DAS INFORMAÇÕES DOS USUÁRIOS ----------/\ */

/* \/---------- ROTAS PARA TRATAMENTO DE INFORMAÇÕES BÁSICAS DOS PERFIS ----------\/ */
//UPDATE BANCO DE DADOS
router.post("/profileUser/update/:id", (req, res) => {
    const user = req.body.user;
    if (user === "cidade") {
        const id = req.body.id;
        const nome = req.body.nome;
        const cnpj = req.body.cnpj;
        const orgResp = req.body.orgResp;
        const cnpjOrgResp = req.body.cnpjOrgResp;
        const rua = req.body.rua;
        const bairro = req.body.bairro;
        const numero = req.body.numero;
        Cidades.update(
            {
                nomeCidade : nome,
                cnpjCidade : cnpj,
                orgRespCidade : orgResp,
                cnpjOrgRespCidade : cnpjOrgResp,
                endRuaOrgRespCidade : rua,
                endBairroOrgRespCidade : bairro,
                endNumOrgRespCidade : numero
            },
            {where: {id : id}}
        ).then(() => {
            req.session.userCidade = {
                ...req.session.userCidade,
                nome : nome,
                cnpj : cnpj,
                orgResp : orgResp,
                cnpjOrgResp : cnpjOrgResp,
                rua : rua,
                bairro : bairro,
                numero : numero
            };
                req.flash('success', 'Perfil de Cidade atualizado com sucesso.');
                res.redirect("/profileUser");
        }).catch(err => {
            console.error("Erro ao atualizar Cidade:", err);
            req.flash('danger', 'Erro ao atualizar o perfil de Cidade.');
            res.redirect("/profileUser");
        });
    } else if (user === "guia") {
        const id = req.body.id;
        const nome = req.body.nome;
        const cadastro = req.body.cadastro;
        GuiasDeTurismo.update(
            {
                nomeGuia : nome,
                cadGuia : cadastro
            },
            {where: {id : id}}
        ).then(() => {
            req.session.userGuia = {
                ...req.session.userGuia,
                nome : nome,
                cadastro : cadastro
            };
                req.flash('success', 'Perfil de Guia atualizado com sucesso.');
                res.redirect("/profileUser");
        })
        .catch(err => {
            console.error("Erro ao atualizar Guia:", err);
            req.flash('danger', 'Erro ao atualizar o perfil de Guia.');
            res.redirect("/profileUser");
        });
    } else if (user === "turista") {
        const id = req.body.id;
        const nome = req.body.nome;
        const cpf = req.body.cpf;
        const nascimento = req.body.nascimento;
        const rua = req.body.rua;
        const bairro = req.body.bairro;
        const numero = req.body.numero;
        const cidade = req.body.cidade;
        const uf = req.body.uf;
        const formattedNascTurista = formatDate(nascimento);
        Turistas.update(
            {
                nomeTurista : nome,
                cpfTurista : cpf,
                nascTurista : formattedNascTurista,
                endRuaTurista : rua,
                endBairroTurista : bairro,
                endNumTurista : numero,
                endCidadeTurista : cidade,
                endUfTurista : uf
            },
            {where: {id : id}}
        ).then(() => {
            req.session.userTurista = {
                ...req.session.userTurista,
                nome: nome,
                cpf: cpf,
                nasc: formattedNascTurista,
                rua: rua,
                bairro: bairro,
                numero: numero,
                cidade: cidade,
                uf: uf
            };
            req.flash('success', 'Perfil de Turista atualizado com sucesso.');
            res.redirect("/profileUser");
        }).catch(err => {
                console.error("Erro ao atualizar Turista:", err);
                req.flash('danger', 'Erro ao atualizar o perfil de Turista.');
                res.redirect("/profileUser");
            });
    } else {
        req.flash('danger', 'Tipo de usuário inválido.');
        res.redirect("/profileUser");
    }
});
/* /\---------- ROTAS PARA TRATAMENTO DE INFORMAÇÕES BÁSICAS DOS PERFIS ----------/\ */
export default router;