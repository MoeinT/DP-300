# Azure SQL Server Security

## Goals and Objectives

The primary goal of this exercise was to enhance the security of an Azure SQL Server by implementing service endpoints and private links. These approaches are crucial for ensuring that the SQL Server is only accessible through secure and controlled channels.

## Steps

### 1. Infrastructure Setup with Terraform

To manage and deploy the necessary resources, I used Terraform and created several modules:

- **Azure SQL Server and Azure SQL Database**: Deployed using Terraform modules for easy management and reusability.
- **Resource Group**: Created to logically organize all related resources.
- **Virtual Network (VNet) and Subnet**: Provisioned to segregate and secure network resources.
- **Network Security Group (NSG)**: Configured with rules to secure the subnet.
- **Virtual Machine (VM) and Network Interface Card (NIC)**: Deployed to facilitate testing of the SQL Database connection.
- **Public IP Address**: Assigned to the VM for remote access.
- **Network Security Rule**: Added to the NSG to allow RDP access to the VM.

### 2. Testing SQL Database Connection

- **VM Setup**: The VM was configured with Microsoft SQL Management Studio to test connectivity to the SQL Database.
- **Service Endpoint**: Created a server VNet rule to allow communication between the subnet and the SQL Server. This setup was verified by successfully connecting to the database from the VM.

### 3. Implementing Private Endpoint

After verifying the service endpoint, I enhanced security by implementing a private endpoint:

- **Private Endpoint**: Deployed to allow secure, private access to the SQL Server.
- **Private DNS Zone**: Created with the domain name `privatelink.database.windows.net` to manage DNS resolution for the private endpoint.
- **DNS VNet Link**: Established to link the private DNS zone to the VNet.
- **A Record**: Added to map the Fully Qualified Domain Name (FQDN) of the DNS to the private IP address of the endpoint.

### 4. Final Testing and Validation

- **Connection Test**: Verified the database connection from the VM again, ensuring successful access through the private endpoint.
- **Security Check**: Ensured the database was not accessible from any other source, including my own laptop, to confirm the security configuration.

> Note: Implementing both the service endpoint and private link was done in two separate steps to explore both approaches in securing the SQL Database. The private link is a more secure approach in general, as it ensures that nothing goes through the internet.

## Importance of Infrastructure as Code with Terraform

### Modular Approach

Using Terraform's modular approach provides several advantages:

- **Reusability**: Modules can be reused across different projects, reducing the need for repetitive code.
- **Scalability**: Modular code can be easily scaled and maintained.
- **Version Control**: Changes to infrastructure can be tracked and managed effectively through version control systems.

### Managing Infrastructure

Infrastructure as Code (IaC) with Terraform allows for:

- **Automation**: Automated deployment and management of infrastructure, reducing manual errors and increasing efficiency.
- **Consistency**: Ensuring that infrastructure is deployed in a consistent manner every time.
- **Collaboration**: Facilitating collaboration among team members by providing a clear, codified representation of infrastructure.

By leveraging Terraform for this exercise, we ensured a streamlined, repeatable, and secure deployment process for all necessary infrastructure components.
