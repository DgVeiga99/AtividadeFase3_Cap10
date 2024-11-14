-- COMANDO PARA A CRIAÇÃO DAS TABELAS:

-- Tabela de Produtos
CREATE TABLE T_SPV_PRODUTO (
    cd_produto NUMBER(5) PRIMARY KEY,
    nm_produto VARCHAR2(40) NOT NULL,
    in_tipo_cultura VARCHAR2(20) NOT NULL
);

-- Tabela de Localidades
CREATE TABLE T_SPV_LOCALIDADE (
    cd_localidade NUMBER(5) PRIMARY KEY,
    nm_cidade VARCHAR2(80) NOT NULL,
    sg_estado VARCHAR2(2) NOT NULL
);

-- Tabela de Produção
CREATE TABLE T_SPV_PRODUCAO (
    cd_producao NUMBER(5) PRIMARY KEY,
    cd_produto NUMBER(5) NOT NULL,
    cd_localidade NUMBER(5) NOT NULL,
    dt_ano_producao DATE NOT NULL,
    qt_area_colheita FLOAT(12),
    qt_area_colhida FLOAT(12),
    qt_area_produzida FLOAT(12),
    qt_rendimento_medio FLOAT(12),
    vl_producao FLOAT(12),
    CONSTRAINT FK_SPV_PROD_PRODUTO FOREIGN KEY (cd_produto) REFERENCES T_SPV_PRODUTO(cd_produto),
    CONSTRAINT FK_SPV_PROD_LOCAL FOREIGN KEY (cd_localidade) REFERENCES T_SPV_LOCALIDADE(cd_localidade)
);

-- COMANDO PARA CONSULTA DE DADOS:

-- Consulta: Produção total de uma determinada cultura por estado em uma safra
SELECT 
    T_SPV_LOCALIDADE.sg_estado,
    SUM(T_SPV_PRODUCAO.qt_area_produzida) AS total_produzido
FROM 
    T_SPV_PRODUCAO
JOIN 
    T_SPV_LOCALIDADE ON T_SPV_PRODUCAO.cd_localidade = T_SPV_LOCALIDADE.cd_localidade
JOIN 
    T_SPV_PRODUTO ON T_SPV_PRODUCAO.cd_produto = T_SPV_PRODUTO.cd_produto
WHERE 
    T_SPV_PRODUTO.nm_produto = 'Cultura Específica' AND 
    EXTRACT(YEAR FROM T_SPV_PRODUCAO.dt_ano_producao) = 2023
GROUP BY 
    T_SPV_LOCALIDADE.sg_estado
ORDER BY 
    total_produzido DESC;


-- Consulta: Evolução da área plantada de uma cultura ao longo dos anos
SELECT 
    EXTRACT(YEAR FROM T_SPV_PRODUCAO.dt_ano_producao) AS ano,
    SUM(T_SPV_PRODUCAO.qt_area_colheita) AS area_plantada
FROM 
    T_SPV_PRODUCAO
JOIN 
    T_SPV_PRODUTO ON T_SPV_PRODUCAO.cd_produto = T_SPV_PRODUTO.cd_produto
WHERE 
    T_SPV_PRODUTO.nm_produto = 'Cultura Específica'
GROUP BY 
    EXTRACT(YEAR FROM T_SPV_PRODUCAO.dt_ano_producao)
ORDER BY 
    ano ASC;


-- Consulta: Ranking dos estados com maior produtividade em uma cultura específica
SELECT 
    T_SPV_LOCALIDADE.sg_estado,
    AVG(T_SPV_PRODUCAO.qt_rendimento_medio) AS produtividade_media
FROM 
    T_SPV_PRODUCAO
JOIN 
    T_SPV_LOCALIDADE ON T_SPV_PRODUCAO.cd_localidade = T_SPV_LOCALIDADE.cd_localidade
JOIN 
    T_SPV_PRODUTO ON T_SPV_PRODUCAO.cd_produto = T_SPV_PRODUTO.cd_produto
WHERE 
    T_SPV_PRODUTO.nm_produto = 'Cultura Específica'
GROUP BY 
    T_SPV_LOCALIDADE.sg_estado
ORDER BY 
    produtividade_media DESC;

