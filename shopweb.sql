/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : shopweb

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-12-02 10:11:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categorias`
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `ID_CATEGORIA_CAT` int(11) NOT NULL AUTO_INCREMENT,
  `ST_NOME_CAT` varchar(255) NOT NULL,
  `ST_DESCRICAO_CAT` varchar(255) DEFAULT NULL,
  `DT_CADASTRO_CAT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIA_CAT`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES ('3', 'Bebidas', 'Encontre as melhores bebidas, Vodkas, Vinhos, Sucos ...', null);
INSERT INTO `categorias` VALUES ('4', 'Cama, Mesa e Banho', 'Aqui você encontra tudo de melhor em casa, mesa e banho..', null);
INSERT INTO `categorias` VALUES ('5', 'Eletrodomésticos', 'Encontre os melhores eletrodomésticos para sua casa.', null);
INSERT INTO `categorias` VALUES ('6', 'Eletrônicos', 'Encontre os melhores Eletrônicos do mundo.', null);
INSERT INTO `categorias` VALUES ('7', 'Eletroportáteis', 'Os melhores Eletroportáteis do brasil e do mundo em um so espaço.', null);
INSERT INTO `categorias` VALUES ('8', 'Calçados', 'Os melhores calçados do mundo em só lugar não perca tempo.', null);
INSERT INTO `categorias` VALUES ('9', 'Computadores', 'Melhores computadores do Brasil.', null);

-- ----------------------------
-- Table structure for `categorias_usuario`
-- ----------------------------
DROP TABLE IF EXISTS `categorias_usuario`;
CREATE TABLE `categorias_usuario` (
  `ID_CATEGORIA_CAT` int(11) NOT NULL,
  `ID_USUARIO_USU` int(11) NOT NULL,
  PRIMARY KEY (`ID_CATEGORIA_CAT`,`ID_USUARIO_USU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categorias_usuario
-- ----------------------------
INSERT INTO `categorias_usuario` VALUES ('3', '4');
INSERT INTO `categorias_usuario` VALUES ('4', '4');
INSERT INTO `categorias_usuario` VALUES ('5', '4');
INSERT INTO `categorias_usuario` VALUES ('6', '4');
INSERT INTO `categorias_usuario` VALUES ('7', '4');
INSERT INTO `categorias_usuario` VALUES ('8', '4');
INSERT INTO `categorias_usuario` VALUES ('9', '4');

-- ----------------------------
-- Table structure for `prateleiras`
-- ----------------------------
DROP TABLE IF EXISTS `prateleiras`;
CREATE TABLE `prateleiras` (
  `ID_PRATELEIRA_PRA` int(11) NOT NULL AUTO_INCREMENT,
  `ST_NOME_PRA` varchar(255) NOT NULL,
  `ID_CATEGORIA_CAT` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRATELEIRA_PRA`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of prateleiras
-- ----------------------------
INSERT INTO `prateleiras` VALUES ('6', 'Champagne', '3');
INSERT INTO `prateleiras` VALUES ('7', 'Espumante', '3');
INSERT INTO `prateleiras` VALUES ('8', 'Vinhos', '3');
INSERT INTO `prateleiras` VALUES ('9', 'Vodka', '3');
INSERT INTO `prateleiras` VALUES ('10', 'Whisky', '3');
INSERT INTO `prateleiras` VALUES ('11', 'Colcha', '4');
INSERT INTO `prateleiras` VALUES ('12', 'Jogo de Cama', '4');
INSERT INTO `prateleiras` VALUES ('13', 'Tapete', '4');
INSERT INTO `prateleiras` VALUES ('14', 'Toalhas', '4');
INSERT INTO `prateleiras` VALUES ('15', 'Travesseiro', '4');
INSERT INTO `prateleiras` VALUES ('16', 'Ar Condicionado / Climatizador', '5');
INSERT INTO `prateleiras` VALUES ('17', 'Fogão', '5');
INSERT INTO `prateleiras` VALUES ('18', 'Refrigerador', '5');
INSERT INTO `prateleiras` VALUES ('19', 'Home Theater', '6');
INSERT INTO `prateleiras` VALUES ('20', 'Telefones', '6');
INSERT INTO `prateleiras` VALUES ('21', 'Televisores', '6');
INSERT INTO `prateleiras` VALUES ('22', 'Barbeador', '7');
INSERT INTO `prateleiras` VALUES ('23', 'Cortador de Cabelo', '7');
INSERT INTO `prateleiras` VALUES ('24', 'Nike', '8');
INSERT INTO `prateleiras` VALUES ('25', 'Adidas', '8');
INSERT INTO `prateleiras` VALUES ('26', 'Olimpikus', '8');
INSERT INTO `prateleiras` VALUES ('27', 'Mizuno', '8');
INSERT INTO `prateleiras` VALUES ('28', 'NetBooks', '9');

-- ----------------------------
-- Table structure for `prateleiras_usuario`
-- ----------------------------
DROP TABLE IF EXISTS `prateleiras_usuario`;
CREATE TABLE `prateleiras_usuario` (
  `ID_PRATELEIRA_PRA` int(11) NOT NULL,
  `ID_USUARIO_USU` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRATELEIRA_PRA`,`ID_USUARIO_USU`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of prateleiras_usuario
-- ----------------------------
INSERT INTO `prateleiras_usuario` VALUES ('6', '4');
INSERT INTO `prateleiras_usuario` VALUES ('7', '4');
INSERT INTO `prateleiras_usuario` VALUES ('8', '4');
INSERT INTO `prateleiras_usuario` VALUES ('9', '4');
INSERT INTO `prateleiras_usuario` VALUES ('10', '4');
INSERT INTO `prateleiras_usuario` VALUES ('11', '4');
INSERT INTO `prateleiras_usuario` VALUES ('12', '4');
INSERT INTO `prateleiras_usuario` VALUES ('13', '4');
INSERT INTO `prateleiras_usuario` VALUES ('14', '4');
INSERT INTO `prateleiras_usuario` VALUES ('15', '4');
INSERT INTO `prateleiras_usuario` VALUES ('16', '4');
INSERT INTO `prateleiras_usuario` VALUES ('17', '4');
INSERT INTO `prateleiras_usuario` VALUES ('18', '4');
INSERT INTO `prateleiras_usuario` VALUES ('19', '4');
INSERT INTO `prateleiras_usuario` VALUES ('20', '4');
INSERT INTO `prateleiras_usuario` VALUES ('21', '4');
INSERT INTO `prateleiras_usuario` VALUES ('22', '4');
INSERT INTO `prateleiras_usuario` VALUES ('23', '4');
INSERT INTO `prateleiras_usuario` VALUES ('24', '4');
INSERT INTO `prateleiras_usuario` VALUES ('25', '4');
INSERT INTO `prateleiras_usuario` VALUES ('26', '4');
INSERT INTO `prateleiras_usuario` VALUES ('27', '4');
INSERT INTO `prateleiras_usuario` VALUES ('28', '4');

-- ----------------------------
-- Table structure for `produtos`
-- ----------------------------
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `ID_PRODUTO_PRO` int(11) NOT NULL AUTO_INCREMENT,
  `ST_NOME_PRO` varchar(255) NOT NULL,
  `VL_PRODUTO_PRO` decimal(18,2) NOT NULL,
  `ST_DESCRICAO_PRO` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUTO_PRO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of produtos
-- ----------------------------
INSERT INTO `produtos` VALUES ('12', 'VEUVE CLICQUOT CHAMPAGNE BRUT 3000ML', '1447.51', 'Champagne Veuve Clicquot Brut Jeroboam Uvas: Pinot Noir, Chardonnay e Pinot Meunier Cor amarelo claro, com borbulhas finas e intensas com aromas finos de maçã, cítricos e floral. Na boca elegância, com final longo e um tanto mineral. Harmonização: Frutas cítricas, biscoitos amanteigados, Peixes e frutos do mar. . Garrafa 3000 ml.');
INSERT INTO `produtos` VALUES ('13', 'NORTON VINHO ESPUMANTE DEMI SEC 750ML ARGENTINA', '30.00', 'Imagine um vinho que pudesse fazer parte de todos as comemorações e tornasse as datas especiais ainda mais inesquecíveis: Norton Demi-Sec. É fresco, frutado e levemente adocicado. Para regar sua vida com doces borbulhas!');
INSERT INTO `produtos` VALUES ('14', 'MOET CHANDON CHAMPAGNE ROSE IMPERIAL FRANCA COD.5630', '300.00', 'Rosé Impérial é a expressão mais extrovertida e sedutora do estilo Moët & Chandon e ilustra perfeitamente seu espírito. Borbulhantes pérolas rosa que refletem a amplitude e o brilho da rigorosa seleção do Pinot Noir e a riqueza dos melhores vinhedos da região para revelar a mágica do champagne mais aclamado do mundo.\r\nVívido e generoso, Rosé Impérial distingue-se por uma cor radiante, por um sabor frutado intenso e pelo palato flamboyant que imediatamente seduz e deleita.\r\n\r\nDisponibilidade: garrafa de 750ml.');
INSERT INTO `produtos` VALUES ('15', 'LA CAPRA VINHO PRESENTED BY FAIRVIEW VIOGNIER 750ML AFRICA 2009 ', '800.00', 'As uvas  foram prensadas e a maior parte do suco foi fermentado em tanques de aço inox. Uma pequena quantidade de vinho foi fermentada em barrica de carvalho, aportando corpo e complexidade ao resultado final. O vinho ficou em contato com suas borras por 5 meses antes de ser engarrafado.');
INSERT INTO `produtos` VALUES ('16', 'PRAVDA VODKA POLONIA 750ML COD.01280', '119.90', 'A Pravda é produzida desde 1743, no coração da mundialmente conhecida região produtora de vodka no sul da Polônia: a Bielsko-Biala. É fabricada em pequenos lotes sob as mais rigorosas instruções da mestre de destilaria de sexta geração Aleksandra Kulak, com centeio doce de colheita tardia e não tratado; além da água dos Montes Cárpatos, extraída da fonte mais pura.\r\n');
INSERT INTO `produtos` VALUES ('17', 'NIKE TENIS AIR MAX TAILWIND+ 5 555416 (002)', '380.00', 'Tênis Nike Air Max Tailwind+ 5 tem cabedal feito em espuma estruturada e sem costuras. Reduz a possibilidade de incômodos e possui sistema de amortecimento Max Air que protege a planta do pé.');
INSERT INTO `produtos` VALUES ('18', 'NIKE TENIS WMNS AIR MAX+ 2012 487679 (011) TAM 37', '789.00', 'O Tênis Nike Air Max+ 2012 é a opção perfeita para as mulheres que desejam correr em busca da melhor performance com suporte e segurança. Fabricado com materiais e tecnologias de ponta, é sinônimo de leveza, flexibilidade e conforto. Tem design moderno e cheio de estilo, ideal para corredoras que não abrem mão dos primeiros lugares em todas as ocasiões.');
INSERT INTO `produtos` VALUES ('19', 'TENIS WAVE CREATION 14 8KN30079 TAM 39', '890.00', 'Tudo o que você precisa se tratando de amortecimento, performance e conforto pode ser encontrado no Tênis Mizuno Wave Creation 14. O modelo proporciona corridas mais leves e que aumentam seu desempenho, graças às tecnologias presentes em sua estrutura, as quais foram pensadas para favorecer cada parte do seu pé. Para os atletas de pisada neutra ou subpronada, esta é a melhor escolha.');
INSERT INTO `produtos` VALUES ('20', 'NetBook Dell', '1900.00', 'Coutaldhflkashldkflakshdklfasdf');

-- ----------------------------
-- Table structure for `produtos_prateleiras`
-- ----------------------------
DROP TABLE IF EXISTS `produtos_prateleiras`;
CREATE TABLE `produtos_prateleiras` (
  `ID_PRODUTO_PRO` int(11) NOT NULL,
  `ID_PRATELEIRA_PRA` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRODUTO_PRO`,`ID_PRATELEIRA_PRA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of produtos_prateleiras
-- ----------------------------
INSERT INTO `produtos_prateleiras` VALUES ('12', '6');
INSERT INTO `produtos_prateleiras` VALUES ('13', '7');
INSERT INTO `produtos_prateleiras` VALUES ('14', '7');
INSERT INTO `produtos_prateleiras` VALUES ('15', '8');
INSERT INTO `produtos_prateleiras` VALUES ('16', '9');
INSERT INTO `produtos_prateleiras` VALUES ('17', '24');
INSERT INTO `produtos_prateleiras` VALUES ('18', '24');
INSERT INTO `produtos_prateleiras` VALUES ('19', '25');
INSERT INTO `produtos_prateleiras` VALUES ('20', '28');

-- ----------------------------
-- Table structure for `produtos_usuario`
-- ----------------------------
DROP TABLE IF EXISTS `produtos_usuario`;
CREATE TABLE `produtos_usuario` (
  `ID_USUARIO_USU` int(11) NOT NULL,
  `ID_PRODUTO_PRO` int(11) NOT NULL,
  PRIMARY KEY (`ID_USUARIO_USU`,`ID_PRODUTO_PRO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of produtos_usuario
-- ----------------------------
INSERT INTO `produtos_usuario` VALUES ('4', '12');
INSERT INTO `produtos_usuario` VALUES ('4', '13');
INSERT INTO `produtos_usuario` VALUES ('4', '14');
INSERT INTO `produtos_usuario` VALUES ('4', '15');
INSERT INTO `produtos_usuario` VALUES ('4', '16');
INSERT INTO `produtos_usuario` VALUES ('4', '17');
INSERT INTO `produtos_usuario` VALUES ('4', '18');
INSERT INTO `produtos_usuario` VALUES ('4', '19');
INSERT INTO `produtos_usuario` VALUES ('4', '20');

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `ID_USUARIO_USU` int(11) NOT NULL AUTO_INCREMENT,
  `ST_NOME_USU` varchar(255) NOT NULL,
  `ST_EMAIL_USU` varchar(255) NOT NULL,
  `ST_SENHA_USU` varchar(255) NOT NULL,
  `ST_SEXO_USU` varchar(255) DEFAULT NULL,
  `FL_FORNECEDOR_USU` int(11) DEFAULT NULL,
  `ST_CNPJ_USU` varchar(255) NOT NULL,
  `FL_ATIVO_USU` int(11) DEFAULT NULL,
  `DT_CADASTRO_USU` datetime DEFAULT NULL,
  `ST_CIDADE_USU` varchar(255) DEFAULT NULL,
  `ST_BAIRRO_USU` varchar(255) DEFAULT NULL,
  `ST_ENDERECO_USU` varchar(255) DEFAULT NULL,
  `ST_UF_USU` varchar(255) DEFAULT NULL,
  `ST_CEP_USU` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_USUARIO_USU`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('4', 'Luis Paulo Santos Pereira', 'luispaulo@f5inovacao.com', '745623', 'null', '0', '16554175000180', '1', null, 'Campinas', 'Conjunto Residencial Parque Bandeirantes', 'Rua Joaquim Nunes do Amaral', 'SP', '13033-205');
INSERT INTO `usuarios` VALUES ('5', 'Carlos Eduardo', 'eduardo@eduardo.com', '1111', null, '0', '63244784000112', '0', null, null, null, null, null, null);
INSERT INTO `usuarios` VALUES ('6', 'Viviane Rodriuges', 'vivi@vivi.com', '90909', null, '0', '63244784000110', '0', null, null, null, null, null, null);
INSERT INTO `usuarios` VALUES ('7', 'Marcia de melo', 'melo@melo.com', '987', null, '0', '63244784000123', '0', null, null, null, null, null, null);
INSERT INTO `usuarios` VALUES ('8', 'Joao Cleber', 'cleber@cleber.com', '3131', null, '0', '63244784009113', '0', null, null, null, null, null, null);
INSERT INTO `usuarios` VALUES ('9', 'Mateus henrique', 'henrique@henrique.com', '98098', null, '0', '63241784000113', '1', null, null, null, null, null, null);
INSERT INTO `usuarios` VALUES ('10', 'Maria mercedes', 'mercedes@mercedes.com', '32323', null, '0', '63223784000113', '1', null, null, null, null, null, null);
INSERT INTO `usuarios` VALUES ('11', 'Andre', 'andre@andre.com.br', '745623', null, '0', '09358108000206 ', '0', null, null, null, null, null, null);
