# AtividadeFase3_Cap10

## Descrição Geral - Sistema de Produção de Lavouras (SPV)
Este projeto consiste no desenvolvimento de um sistema de produção de lavouras (SPV) para gerenciamento e análise de dados agrícolas. O sistema foi projetado com base em um modelo lógico e relacional, incluindo a estruturação de tabelas no banco de dados e comandos SQL para criação e consulta.

---

## 1. Arquivos Disponíveis

- 'TabelaDados': Contém todos os dados utilizados para realizar o modelo logico e relacional
- `Modelo Logico.pdf`: Apresenta a esturura final do modelo lógico do banco de dados.
- `Modelo Relacional.pdf`: Apresenta a esturura final do modelo relacional do sistema.
- `Comandos_SQL.sql`: Contém os comandos SQL para criar as tabelas e realizar consultas.
- `MapaAtividadeFase3_Cap10.xlsx`: Tabela auxiliar que complementa a análise dos dados do sistema.
- `SISTEMA_PRODUCAO_LAVOURAS.dmd`: Arquivo do modelo conceitual realizado no Data Modeler.

## 2. Modelos do Sistema

### 2.1. Modelo Lógico

![image](https://github.com/user-attachments/assets/b11e17e0-4216-4b52-bbbe-c2e3c8e58a50)


O modelo lógico define a estrutura básica do banco de dados. As tabelas principais incluem:
- **T_SPV_PRODUTO**: Contém informações sobre os produtos agrícolas, como nome e tipo de cultura (permanente ou temporária).
- **T_SPV_LOCALIDADE**: Registra localidades com seus respectivos estados e cidades.
- **T_SPV_PRODUCAO**: Armazena dados de produção, como ano, área plantada, produtividade e valores.

**Campos das Tabelas (Modelo Lógico):**
- **T_SPV_PRODUTO**:
  - `cd_produto`: Identificador único do produto (chave primária).
  - `nm_produto`: Nome do produto.
  - `in_tipo_cultura`: Tipo de cultura do produto.
- **T_SPV_LOCALIDADE**:
  - `cd_localidade`: Identificador único da localidade (chave primária).
  - `nm_cidade`: Nome da cidade.
  - `sg_estado`: Sigla do estado.
- **T_SPV_PRODUCAO**:
  - `cd_producao`: Identificador único da produção (chave primária).
  - `cd_produto`: Referência ao produto (chave estrangeira).
  - `cd_localidade`: Referência à localidade (chave estrangeira).
  - `dt_ano_producao`: Ano da produção.
  - `qt_area_colheita`: Quantidade de área disponível para colheita.
  - `qt_area_colhida`: Quantidade de área efetivamente colhida.
  - `qt_area_produzida`: Quantidade total produzida.
  - `qt_rendimento_medio`: Rendimento médio da produção.
  - `vl_producao`: Valor total da produção.

---

### 2.2. Modelo Relacional

![image](https://github.com/user-attachments/assets/18e1595d-6a19-4a89-b683-dd3d8ee05b98)

O modelo relacional adapta o modelo lógico para ser implementado diretamente no banco de dados.

**Estruturas principais:**
- As tabelas são formalizadas com tipos de dados apropriados para SQL (`NUMBER`, `VARCHAR2`, `DATE`, etc.).
- Chaves primárias (PK) e estrangeiras (FK) são definidas explicitamente:
  - `PK_T_SPV_PRODUCAO (cd_producao)`
  - `FK_SPV_PROD_PRODUTO (cd_produto)`
  - `FK_SPV_PROD_LOCAL (cd_localidade)`

---

## 3. Comandos SQL

### 3.1. Criação das Tabelas
Os comandos para criar as tabelas foram organizados no arquivo `Comandos_SQL.sql`. Eles incluem:
- Definição de chaves primárias e estrangeiras.
- Tipos de dados otimizados para armazenamento e processamento de informações.

### 3.2. Consultas SQL
Algumas consultas relevantes para análise de dados foram desenvolvidas:
1. **Produção total de uma determinada cultura por estado em uma safra:**

   Calcula a produção total agrupada por estado para uma cultura específica em um ano definido.
3. **Evolução da área plantada de uma cultura ao longo dos anos:**

   Analisa como a área plantada de uma cultura específica mudou ao longo do tempo.
5. **Ranking dos estados com maior produtividade em uma cultura específica:**

   Lista os estados com maior rendimento médio para uma cultura.

---

## 4. Como Usar
1. Utilize o arquivo `Comandos_SQL.sql` para criar as tabelas no banco de dados.
2. Insira os dados necessários para execução das consultas.
3. Execute as consultas SQL fornecidas para análise.
