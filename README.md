# DP-300
Learning and documenting learning materials for the "Microsoft Certified: Azure Database Administrator Associate" exam.

## Azure SQL Database Purchasing Models
When specifying the `sku_name` parameter in Terraform for Azure SQL Database, we need to choose the appropriate value based on the desired purchasing model (vCore or DTU), service tier, and configuration. This ensures you configure your Azure SQL Database according to your specific performance and cost requirements. Find below an overview of the two purchasing models and their corresponding `sku_name` value in Terraform.

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
