# DP-300
We will be learning and documenting materials for the "Microsoft Certified: Azure Database Administrator Associate" exam. Key resources essential for becoming a Database Administrator will be reviewed as part of this certification.

Relevant resources, including Azure SQL Server, SQL Database, SQL Server Rules, and security features like Service Endpoint and Private Links, will be deployed and managed using Infrastructure as Code (IaC) principles with Terraform.

## Azure SQL Database Purchasing Models
When specifying the ```sku_name``` parameter in Terraform for Azure SQL Database, it is crucial to choose the appropriate value based on the desired purchasing model (vCore or DTU), service tier, and configuration. This ensures that your Azure SQL Database is configured to meet your specific performance and cost requirements. Below is an overview of the two purchasing models and their corresponding ```sku_name``` values in Terraform:

### vCore-Based Purchasing Model
#### 1. General Purpose Tier
- **Provisioned (Gen5)**:
  - `GP_Gen5_2`: General Purpose, Generation 5, 2 vCores
  - `GP_Gen5_4`: General Purpose, Generation 5, 4 vCores
  - `GP_Gen5_6`: General Purpose, Generation 5, 6 vCores
  - `GP_Gen5_8`: General Purpose, Generation 5, 8 vCores
  - `GP_Gen5_10`: General Purpose, Generation 5, 10 vCores
  - `GP_Gen5_12`: General Purpose, Generation 5, 12 vCores
  - `GP_Gen5_14`: General Purpose, Generation 5, 14 vCores
  - `GP_Gen5_16`: General Purpose, Generation 5, 16 vCores
  - `GP_Gen5_18`: General Purpose, Generation 5, 18 vCores
  - `GP_Gen5_20`: General Purpose, Generation 5, 20 vCores
  - `GP_Gen5_24`: General Purpose, Generation 5, 24 vCores
  - `GP_Gen5_32`: General Purpose, Generation 5, 32 vCores
  - `GP_Gen5_40`: General Purpose, Generation 5, 40 vCores
  - `GP_Gen5_80`: General Purpose, Generation 5, 80 vCores

- **Provisioned (DC-Series, Gen5)**:
  - `GP_DC_Gen5_2`: General Purpose, DC-Series, Generation 5, 2 vCores
  - `GP_DC_Gen5_4`: General Purpose, DC-Series, Generation 5, 4 vCores
  - `GP_DC_Gen5_8`: General Purpose, DC-Series, Generation 5, 8 vCores
  - `GP_DC_Gen5_16`: General Purpose, DC-Series, Generation 5, 16 vCores

- **Serverless (Gen5)**:
  - `GP_S_Gen5_1`: General Purpose, Serverless, Generation 5, 1 vCore
  - `GP_S_Gen5_2`: General Purpose, Serverless, Generation 5, 2 vCores
  - `GP_S_Gen5_3`: General Purpose, Serverless, Generation 5, 3 vCores
  - `GP_S_Gen5_4`: General Purpose, Serverless, Generation 5, 4 vCores
  - `GP_S_Gen5_6`: General Purpose, Serverless, Generation 5, 6 vCores
  - `GP_S_Gen5_8`: General Purpose, Serverless, Generation 5, 8 vCores
  - `GP_S_Gen5_10`: General Purpose, Serverless, Generation 5, 10 vCores
  - `GP_S_Gen5_12`: General Purpose, Serverless, Generation 5, 12 vCores
  - `GP_S_Gen5_14`: General Purpose, Serverless, Generation 5, 14 vCores
  - `GP_S_Gen5_16`: General Purpose, Serverless, Generation 5, 16 vCores

#### 2. Business Critical Tier
- **Provisioned (Gen5)**:
  - `BC_Gen5_2`: Business Critical, Generation 5, 2 vCores
  - `BC_Gen5_4`: Business Critical, Generation 5, 4 vCores
  - `BC_Gen5_8`: Business Critical, Generation 5, 8 vCores
  - `BC_Gen5_16`: Business Critical, Generation 5, 16 vCores
  - `BC_Gen5_24`: Business Critical, Generation 5, 24 vCores
  - `BC_Gen5_32`: Business Critical, Generation 5, 32 vCores
  - `BC_Gen5_40`: Business Critical, Generation 5, 40 vCores
  - `BC_Gen5_80`: Business Critical, Generation 5, 80 vCores

#### 3. Hyperscale Tier
- **Provisioned (Gen5)**:
  - `HS_Gen5_2`: Hyperscale, Generation 5, 2 vCores
  - `HS_Gen5_4`: Hyperscale, Generation 5, 4 vCores
  - `HS_Gen5_8`: Hyperscale, Generation 5, 8 vCores
  - `HS_Gen5_16`: Hyperscale, Generation 5, 16 vCores
  - `HS_Gen5_24`: Hyperscale, Generation 5, 24 vCores
  - `HS_Gen5_32`: Hyperscale, Generation 5, 32 vCores
  - `HS_Gen5_40`: Hyperscale, Generation 5, 40 vCores
  - `HS_Gen5_80`: Hyperscale, Generation 5, 80 vCores
### DTU-Based Purchasing Model
#### 1. Basic Tier
- `Basic`: Basic
#### 2. Standard Tier
- **Standard Performance Levels**:
  - `S0`: Standard, S0
  - `S1`: Standard, S1
  - `S2`: Standard, S2
  - `S3`: Standard, S3
  - `S4`: Standard, S4
  - `S6`: Standard, S6
  - `S7`: Standard, S7
  - `S9`: Standard, S9
  - `S12`: Standard, S12
#### 3. Premium Tier
- **Premium Performance Levels**:
  - `P1`: Premium, P1
  - `P2`: Premium, P2
  - `P4`: Premium, P4
  - `P6`: Premium, P6
  - `P11`: Premium, P11
  - `P15`: Premium, P15
#### 4. Data Warehousing Tier
- **DWU-Based Model**:
  - `DW100c`: Data Warehousing, 100 DWU
  - `DW200c`: Data Warehousing, 200 DWU
  - `DW300c`: Data Warehousing, 300 DWU
  - `DW400c`: Data Warehousing, 400 DWU
  - `DW500c`: Data Warehousing, 500 DWU
  - `DW1000c`: Data Warehousing, 1000 DWU
  - `DW1500c`: Data Warehousing, 1500 DWU
  - `DW2000c`: Data Warehousing, 2000 DWU
  - `DW3000c`: Data Warehousing, 3000 DWU
  - `DW6000c`: Data Warehousing, 6000 DWU
  - `DW7500c`: Data Warehousing, 7500 DWU
  - `DW10000c`: Data Warehousing, 10000 DWU
  - `DW15000c`: Data Warehousing, 15000 DWU
  - `DW30000c`: Data Warehousing, 30000 DWU

## Execution plan in Azure SQL
In order to execute SQL queries, SQL Server Database Engine needs to assess the statements to determine the most efficient approach to access and process the underlying data. This is handled by a component called Query Optimizer The query optimizer uses three types of information to determine the most efficient execution plan:
- **The query:** Contains the sql statement that includes what data needs to be retrived and processed.
- **Database schema:** This includes the structure of the database, such as the definitions of tables, columns, indexes, and relationships between tables.
- **Database statistics:** Contains information about the distribution of data within tables and indexes. They include data like the number of rows in a table, the distribution of values in a column, and the presence of NULL values.

The output of the Query Optimizer is an execution plan, aka a query plan. An execution plan consists of the following: 
- **The sequence in which the source tables are accessed**
- **The methods used to extract data from the each table**
- **The methods used to compute calculations, and how to filter, aggregate and sort**

SQL Server Management Studio has three options to display execution plans:
- **Estimated Execution Plan:** This will not show any runtime information, like usage metrics or runtime warnings. Instead, it shows the execution plan that the query optimizor would most probably use if the query were executed, and shows estimated number of rows flowing through several operators. See the [documentation](https://learn.microsoft.com/en-us/sql/relational-databases/performance/display-the-estimated-execution-plan?view=sql-server-ver16) for more details.
- **Actual Execution Plan:** This is generated after the SQL queries, or batches are executed. For this reason, it contains runtime information like usage metrics, and runtime warnings, if any. See the [documentation](https://learn.microsoft.com/en-us/sql/relational-databases/performance/display-an-actual-execution-plan?view=sql-server-ver16) to see how to use it using sql server management studio.
- **Live Query Statistics:** This live query plan provides real-time insights into the query execution process as the controls flow from one query plan operator to another. The live query plan displays the overall query progress and operator-level run-time execution statistics such as the number of rows produced, elapsed time, operator progress, etc. Because this data is available in real time without needing to wait for the query to complete, these execution statistics are extremely useful for debugging query performance issues. See the [documentation](https://learn.microsoft.com/en-us/sql/relational-databases/performance/live-query-statistics?view=sql-server-ver16).

### Overview of Indexes in Azure SQL
Indexes in Azure SQL, much like in other relational database systems, are structures that improve the speed of data retrieval operations on a database table at the cost of additional storage and write overhead. They are critical for efficient query performance, especially for large datasets.

#### Types of Indexes
- **Non-clustered index:** A non-clustered index provide a sorted list of references to the data in the table. A table can have multiple non-clustered indexes. 
  - The drawback to this kind of index is that it needs an additional storage space and creates an overhead on write operation, since the index needs to be updated.
  - Improves the speed of retrieval operations by providing quick access to data rows. Useful for queries that search for a subset of columns.
- **Clustered indexes:** A clustered index, on the other hand, determines the physical order of data in the table. There can only be one clustered index per table, since the rows can be sorted in only on order. 
  - The drawback to this type of index is that it creates overhead to insert, delete and update operations, since the order of data needs to be maintained on each of those operations.
  - Efficient for range queries and retrievals that require sorting. Since the data is physically ordered, retrieving ranges of data is faster.
- **Columnstore Index:** Stores data in a columnar format instead of row-based. 
  - Significantly reduces storage requirements through efficient data compression techniques. Also enhances performance for aggregation and scan operations by reading only the relevant columns.

### Different types of joins in Azure SQL
When joining different tables in Azure SQL, there are three main types of join algorithms available: **Nested Loop Join**, **Merge Join**, and **Hash Join**. Each of these join methods has different characteristics, efficiencies, and use cases. Here's an overview of these join types:
- **Nested loop:** For each row in the outer (left) table, it searches for matches in the inner (right) table. This kind of join is most efficient when the outer table is small, and the inner table is index, and the worst case scenario would be when both tables are large and not indexes, which leads to a high number of comparisons.
- **Merge join:** The Merge Join algorithm is efficient for joining large, sorted datasets. It requires that both input tables be sorted on the join keys. 
  - Performs a single pass through each table, resulting in O(n + m) complexity, where n and m are the number of rows in the respective tables.
  - An example scenario where merge join is efficient is when both tables have a non-clustered index on the join column, since the index create a sorted reference of the join column. Particularly effective for equi-joins, where rows are joined based on equality of the join keys.
- **Hash join:** Hash joins are a method used by databases to efficiently combine data from two large sets, particularly useful when the data isn't sorted or indexed in a way that facilitates other join methods like nested loops or merge joins. There are 3 kinds of hash join: **Memory Hash**, **Grace Hash**, and **Recursive Hash**. For more details on these types, see [this documentation](https://learn.microsoft.com/en-us/sql/relational-databases/performance/joins?view=sql-server-ver16#hash). Here's a overview of the Hash join algorithm:
  1. A hash join involves two main inputs: the **build input** and the **probe input**. The smaller of the two inputs is typically designated as the build input.
  2. During a hash join, the database first reads the entire build input and creates a hash table in memory. Each row from the build input is hashed based on a specified key (hash key) and stored in corresponding hash buckets in memory.
  3. After building the hash table, it scans through the probe table and for each row in the probe table, it calculates the hash key and looks up for matching rows in the build table. So, matches are produced based on the hash key, efficiently joining rows on two tables. 

## Transparent Data Encryption
Transparent data encryption (TDE) encrypts SQL Server, Azure SQL Database, and Azure Synapse Analytics data files. This encryption is known as encrypting data at rest.

Encryption of a database file is done at the page level. The pages in an encrypted database are encrypted before they're written to disk and are decrypted when read into memory. TDE doesn't increase the size of the encrypted database.

By default, the underlying data in the disk attached to the SQL Database is encrypted with a Microsoft-managed encryption key. However, it is possible to enable the customer-managed key and use keys defined within Azure Key Vault for the encryptions. For more information about TDE, see [this documentation](https://learn.microsoft.com/en-us/sql/relational-databases/security/encryption/transparent-data-encryption?view=sql-server-ver16).

## Dynamic Data Masking 
Dynamic data masking limits exposure of sensitive data to nonpriviledged users. It's a security feature that hides the sensitive data in a result set of a query over database designated fields without affecting or changing underlying data in the database. Read [this documentation](https://learn.microsoft.com/en-us/azure/azure-sql/database/dynamic-data-masking-overview?view=azuresql) for more information about Dynamic Data Masking and its types and examples.

## Always Encrypted
This feature allows encryption of sensitive data at rest or in transit. With this feature, you can encrypt multiple or a single column in one or different databases. There are two kinds of encryptions:
- **Deterministic encryption**: Produces a same encrypted value for a given plain text value; less secure, but allows group by, indexing and equality join operations on encrypted columns.
- **Randomized encryption**: Encryps values in a less predictable manner and it's a more secure encryption option, but prevents group by, lookup or join operations on encrypted columns. 

In order to created encryption on the columns, we need to provision the following keys: 
- **Column encryption keys**: Used to encrypt data in an encrypted column
- **Column master keys**: The column master key is a key-protecting key that encrypts one or more column encryption keys. In order to create and implement the always encryption key feature, we can use the SQL Server Management Studio using the following steps: 
- Make sure you have all key and all cryptographic permissions on the Azure Key Vault Access Policies 
- Log in as an admin to SSMS and right click on the desired table and select *encrypt column* and then the column we'd like to encrypt. SSMS will automatically provision the required keys in either **Azure Key Vault** or **Windows Certification Keys**. For more details on how to provision an always encypted key with SSMS, see [this documentation](https://learn.microsoft.com/en-us/sql/relational-databases/security/encryption/configure-always-encrypted-keys-using-ssms?view=sql-server-ver16).

## Summary of the most important SQL statements
- It's important to note the difference between the ```WHERE``` and the ```HAVING``` clause. The ```WHERE``` command filters individual rows in the source data, but the ```HAVING``` clause filters out what you have after the ```GROUP BY``` operation.  