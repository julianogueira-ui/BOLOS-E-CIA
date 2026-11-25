-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bolo`
--

DROP TABLE IF EXISTS `bolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolo` (
  `idBolo` int NOT NULL AUTO_INCREMENT,
  `idCobertura` int DEFAULT NULL,
  `idUsuario` int NOT NULL,
  `idCategoria` int NOT NULL,
  `NomeBolo` varchar(100) NOT NULL,
  `RendimentoPorcao` int NOT NULL,
  `Dificuldade` varchar(20) NOT NULL,
  `Descricao` text NOT NULL,
  `PreparoMassa` text NOT NULL,
  `Imagem` varchar(1000) NOT NULL,
  `TempoPreparo` varchar(45) NOT NULL,
  PRIMARY KEY (`idBolo`),
  KEY `fk_BOLO_COBERTURA1_idx` (`idCobertura`),
  KEY `fk_BOLO_USUARIO1_idx` (`idUsuario`),
  KEY `fk_BOLO_CATEGORIA1_idx` (`idCategoria`),
  CONSTRAINT `fk_BOLO_CATEGORIA1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `fk_BOLO_COBERTURA1` FOREIGN KEY (`idCobertura`) REFERENCES `cobertura` (`idCobertura`),
  CONSTRAINT `fk_BOLO_USUARIO1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolo`
--

LOCK TABLES `bolo` WRITE;
/*!40000 ALTER TABLE `bolo` DISABLE KEYS */;
INSERT INTO `bolo` VALUES (1,1,1,1,'Bolo de Chocolate Fofinho',15,'Fácil','Bolo de chocolate leve, macio e delicioso.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://receitasdepanela.com.br/wp-content/uploads/2025/12/BOLO-DE-CHOCOLATE-FOFINHO.jpg','55 min'),(2,4,2,2,'Bolo de Cenoura com Chocolate',16,'Fácil','Clássico bolo de cenoura com calda de chocolate.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://recipesblob.oetker.com.br/assets/11ed1b54a18b427ea8e7f7d141f0a34d/1272x764/bolo_cenoura_horizontal.jpg','50 min'),(3,6,3,3,'Bolo de Morango',12,'Média','Massa branca com pedaços de morango.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://www.sabornamesa.com.br/media/k2/items/cache/24d767ce6c156eb07b1fc26c266211f5_XL.jpg','60 min'),(4,5,4,3,'Bolo de Limão',14,'Fácil','Bolo úmido com sabor cítrico.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://revistaanamaria.com.br/wp-content/uploads/2022/11/Bolo-de-limao.jpg','45 min'),(5,15,5,4,'Bolo de Fubá Cremoso',12,'Fácil','Bolo de fubá macio, ótimo com café.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+de+Fubá+Cremoso','50 min'),(6,8,6,8,'Bolo de Coco',15,'Fácil','Bolo fofinho com coco ralado.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+de+Coco','55 min'),(7,2,7,5,'Bolo de Festa com Brigadeiro',20,'Média','Bolo de chocolate para festas.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+de+Festa+com+Brigadeiro','75 min'),(8,7,8,9,'Bolo de Leite em Pó',12,'Fácil','Bolo simples para o café da tarde.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+de+Leite+em+Pó','45 min'),(9,4,9,6,'Bolo Vegano de Chocolate',10,'Média','Sem ovos e sem leite de origem animal.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+Vegano+de+Chocolate','50 min'),(10,3,10,10,'Bolo de Aniversário Recheado',20,'Difícil','Bolo recheado com chantilly.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+de+Aniversário+Recheado','90 min'),(11,9,11,11,'Bolo Recheado de Doce de Leite',16,'Média','Massa branca com recheio de doce de leite.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+Recheado+de+Doce+de+Leite','70 min'),(12,14,12,12,'Bolo Simples de Leite',10,'Fácil','Receita básica do dia a dia.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+Simples+de+Leite','40 min'),(13,11,13,13,'Bolo Gelado de Coco',15,'Média','Bolo molhadinho servido gelado.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+Gelado+de+Coco','65 min'),(14,15,14,14,'Bolo Integral de Cenoura',12,'Fácil','Versão mais leve do bolo de cenoura.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+Integral+de+Cenoura','50 min'),(15,13,15,9,'Bolo de Café com Chocolate',12,'Média','Para quem gosta de sabor intenso.','1) Misture os ingredientes secos. 2) Junte os líquidos e bata até ficar homogêneo. 3) Asse em forno a 180°C em forma untada.','https://placehold.co/400x250?text=Bolo+de+Café+com+Chocolate','55 min');
/*!40000 ALTER TABLE `bolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bolo_ingrediente`
--

DROP TABLE IF EXISTS `bolo_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolo_ingrediente` (
  `idBolo` int NOT NULL,
  `idIngrediente` int NOT NULL,
  `QuantidadeBolo` decimal(8,2) NOT NULL,
  `UnidadeMedidaBolo` varchar(20) NOT NULL,
  PRIMARY KEY (`idBolo`,`idIngrediente`),
  KEY `fk_BOLO_INGREDIENTE_INGREDIENTE1_idx` (`idIngrediente`),
  CONSTRAINT `fk_BOLO_INGREDIENTE_BOLO` FOREIGN KEY (`idBolo`) REFERENCES `bolo` (`idBolo`),
  CONSTRAINT `fk_BOLO_INGREDIENTE_INGREDIENTE1` FOREIGN KEY (`idIngrediente`) REFERENCES `ingrediente` (`idIngrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolo_ingrediente`
--

LOCK TABLES `bolo_ingrediente` WRITE;
/*!40000 ALTER TABLE `bolo_ingrediente` DISABLE KEYS */;
INSERT INTO `bolo_ingrediente` VALUES (1,1,300.00,'g'),(1,2,200.00,'g'),(1,3,4.00,'unidade'),(1,4,200.00,'ml'),(1,5,2.00,'colher (sopa)'),(1,6,4.00,'colher (sopa)'),(1,7,1.00,'colher (sopa)'),(2,1,300.00,'g'),(2,2,200.00,'g'),(2,3,4.00,'unidade'),(2,7,1.00,'colher (sopa)'),(2,8,3.00,'unidade'),(2,9,100.00,'ml'),(3,1,300.00,'g'),(3,2,200.00,'g'),(3,3,4.00,'unidade'),(3,4,150.00,'ml'),(3,7,1.00,'colher (sopa)'),(3,10,250.00,'g'),(4,1,300.00,'g'),(4,2,200.00,'g'),(4,3,4.00,'unidade'),(4,4,150.00,'ml'),(4,5,100.00,'g'),(4,11,2.00,'unidade'),(5,1,300.00,'g'),(5,2,200.00,'g'),(5,3,4.00,'unidade'),(5,4,300.00,'ml'),(5,7,1.00,'colher (sopa)'),(5,14,200.00,'g'),(6,1,300.00,'g'),(6,2,200.00,'g'),(6,3,4.00,'unidade'),(6,4,200.00,'ml'),(6,12,1.00,'lata'),(6,15,100.00,'g'),(7,1,300.00,'g'),(7,2,200.00,'g'),(7,3,4.00,'unidade'),(7,6,5.00,'colher (sopa)'),(7,12,1.00,'lata'),(7,13,1.00,'lata'),(8,1,300.00,'g'),(8,2,200.00,'g'),(8,3,4.00,'unidade'),(8,4,250.00,'ml'),(8,5,150.00,'g'),(8,7,1.00,'colher (sopa)'),(9,1,300.00,'g'),(9,2,200.00,'g'),(9,3,4.00,'unidade'),(9,6,5.00,'colher (sopa)'),(9,7,1.00,'colher (sopa)'),(9,9,100.00,'ml'),(10,1,300.00,'g'),(10,2,200.00,'g'),(10,3,4.00,'unidade'),(10,4,200.00,'ml'),(10,7,1.00,'colher (sopa)'),(10,13,1.00,'lata'),(11,1,300.00,'g'),(11,2,200.00,'g'),(11,3,4.00,'unidade'),(11,4,200.00,'ml'),(11,5,100.00,'g'),(11,12,1.00,'lata'),(12,1,300.00,'g'),(12,2,200.00,'g'),(12,3,4.00,'unidade'),(12,4,200.00,'ml'),(12,7,1.00,'colher (sopa)'),(12,9,100.00,'ml'),(13,1,300.00,'g'),(13,2,200.00,'g'),(13,3,4.00,'unidade'),(13,12,1.00,'lata'),(13,13,1.00,'lata'),(13,15,100.00,'g'),(14,1,300.00,'g'),(14,2,200.00,'g'),(14,3,4.00,'unidade'),(14,7,1.00,'colher (sopa)'),(14,8,2.00,'unidade'),(14,9,80.00,'ml'),(15,1,300.00,'g'),(15,2,200.00,'g'),(15,3,4.00,'unidade'),(15,4,150.00,'ml'),(15,6,3.00,'colher (sopa)'),(15,7,1.00,'colher (sopa)');
/*!40000 ALTER TABLE `bolo_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Chocolate'),(2,'Cenoura'),(3,'Frutas'),(4,'Tradicional'),(5,'Festa'),(6,'Vegano'),(7,'Sem glúten'),(8,'Coco'),(9,'Café da tarde'),(10,'Aniversário'),(11,'Recheado'),(12,'Simples'),(13,'Gelado'),(14,'Integral'),(15,'Fit');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobertura`
--

DROP TABLE IF EXISTS `cobertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobertura` (
  `idCobertura` int NOT NULL AUTO_INCREMENT,
  `NomeCobertura` varchar(100) NOT NULL,
  `PreparoCobertura` text NOT NULL,
  PRIMARY KEY (`idCobertura`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobertura`
--

LOCK TABLES `cobertura` WRITE;
/*!40000 ALTER TABLE `cobertura` DISABLE KEYS */;
INSERT INTO `cobertura` VALUES (1,'Ganache de chocolate','Aqueça o creme de leite, despeje sobre o chocolate e mexa até ficar liso.'),(2,'Brigadeiro','Cozinhe o leite condensado com o chocolate em fogo baixo até desgrudar do fundo.'),(3,'Chantilly','Bata o creme de leite gelado com o açúcar até firmar.'),(4,'Calda de chocolate','Misture o chocolate com o açúcar e leve ao fogo até engrossar.'),(5,'Glacê de limão','Misture o suco de limão com o açúcar até formar um creme.'),(6,'Calda de morango','Cozinhe os morangos com o açúcar até virar uma calda.'),(7,'Cobertura de leite em pó','Misture o leite em pó com a manteiga e o leite até dar ponto de cobertura.'),(8,'Cobertura de coco','Cozinhe o leite condensado com o coco ralado por 5 minutos.'),(9,'Doce de leite','Cozinhe o leite com o açúcar, mexendo sempre, até engrossar.'),(10,'Glacê real','Bata a clara com o açúcar até obter um glacê branco e firme.'),(11,'Creme de leite com chocolate','Misture o creme de leite com o chocolate em pó em fogo baixo.'),(12,'Cobertura cremosa de limão','Bata o leite condensado com o suco de limão até engrossar.'),(13,'Cobertura de café','Dissolva o café no leite quente, junte o açúcar e cozinhe até encorpar.'),(14,'Cobertura de manteiga','Bata a manteiga com o açúcar até virar um creme claro.'),(15,'Cobertura simples de açúcar','Misture o açúcar com o leite e leve ao fogo por 2 minutos.');
/*!40000 ALTER TABLE `cobertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cobertura_ingrediente`
--

DROP TABLE IF EXISTS `cobertura_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cobertura_ingrediente` (
  `idCobertura` int NOT NULL,
  `idIngrediente` int NOT NULL,
  `QuantidadeCobertura` decimal(8,2) NOT NULL,
  `UnidadeMedidaCobertura` varchar(20) NOT NULL,
  PRIMARY KEY (`idCobertura`,`idIngrediente`),
  KEY `fk_COBERTURA_INGREDIENTE_COBERTURA1_idx` (`idCobertura`),
  KEY `fk_COBERTURA_INGREDIENTE_INGREDIENTE1_idx` (`idIngrediente`),
  CONSTRAINT `fk_COBERTURA_INGREDIENTE_COBERTURA1` FOREIGN KEY (`idCobertura`) REFERENCES `cobertura` (`idCobertura`),
  CONSTRAINT `fk_COBERTURA_INGREDIENTE_INGREDIENTE1` FOREIGN KEY (`idIngrediente`) REFERENCES `ingrediente` (`idIngrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cobertura_ingrediente`
--

LOCK TABLES `cobertura_ingrediente` WRITE;
/*!40000 ALTER TABLE `cobertura_ingrediente` DISABLE KEYS */;
INSERT INTO `cobertura_ingrediente` VALUES (1,6,100.00,'g'),(1,13,200.00,'ml'),(2,6,4.00,'colher (sopa)'),(2,12,1.00,'lata'),(3,2,3.00,'colher (sopa)'),(3,13,300.00,'ml'),(4,2,100.00,'g'),(4,6,5.00,'colher (sopa)'),(5,2,200.00,'g'),(5,11,2.00,'unidade'),(6,2,100.00,'g'),(6,10,250.00,'g'),(7,4,100.00,'ml'),(7,5,2.00,'colher (sopa)'),(8,12,1.00,'lata'),(8,15,100.00,'g'),(9,2,400.00,'g'),(9,4,1000.00,'ml'),(10,2,200.00,'g'),(10,3,1.00,'unidade'),(11,6,3.00,'colher (sopa)'),(11,13,1.00,'lata'),(12,11,3.00,'unidade'),(12,12,1.00,'lata'),(13,2,150.00,'g'),(13,4,200.00,'ml'),(14,2,200.00,'g'),(14,5,150.00,'g'),(15,2,200.00,'g'),(15,4,100.00,'ml');
/*!40000 ALTER TABLE `cobertura_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `idIngrediente` int NOT NULL AUTO_INCREMENT,
  `NomeIngrediente` varchar(100) NOT NULL,
  PRIMARY KEY (`idIngrediente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Farinha de trigo'),(2,'Açúcar'),(3,'Ovos'),(4,'Leite'),(5,'Manteiga'),(6,'Chocolate em pó'),(7,'Fermento em pó'),(8,'Cenoura'),(9,'Óleo'),(10,'Morango'),(11,'Limão'),(12,'Leite condensado'),(13,'Creme de leite'),(14,'Fubá'),(15,'Coco ralado');
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Heloisa Sant\' Ana Ferreira','heloisa@email.com'),(2,'Júlia Nogueira Ferreira','julia@email.com'),(3,'Ana Beatriz Souza','ana.souza@email.com'),(4,'Carlos Eduardo Lima','carlos.lima@email.com'),(5,'Fernanda Alves','fernanda.alves@email.com'),(6,'João Pedro Santos','joao.santos@email.com'),(7,'Mariana Costa','mariana.costa@email.com'),(8,'Rafael Oliveira','rafael.oliveira@email.com'),(9,'Larissa Martins','larissa.martins@email.com'),(10,'Gabriel Rocha','gabriel.rocha@email.com'),(11,'Camila Ribeiro','camila.ribeiro@email.com'),(12,'Lucas Pereira','lucas.pereira@email.com'),(13,'Patrícia Gomes','patricia.gomes@email.com'),(14,'Bruno Carvalho','bruno.carvalho@email.com'),(15,'Juliana Barros','juliana.barros@email.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25 18:28:32
