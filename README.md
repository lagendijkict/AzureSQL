# AzureSQL
Lately I've been learning for the Azure DP-203 exam. I regularly need to set up a SQL Server with SQL Database, so I decided to automate some of it.

I bought a Azure sandbox from Whizlabs to save some money on Azure costs. Main disadvantage is that the sandbox gets destroyed after 3 hours, so if you want to practice again after that time, you need to create a new sandbox.

## Steps to use the PowerShell script

1. Save Startup.ps1 on your computer, fill the specific values such as location and ip address.
2. Create Whizlabs sandbox (or other brand of your liking).
3. Copy resourcegroup name.
4. Open Powershell, and navigate to the folder where you stored Startup.ps1
5. Use .\Startup.ps1 command with resourcegroup name as a parameter.
6. Login to your (Whizlabs) Azure account when prompted.

The Azure SQL Server is now created within your Azure subscription, an Azure SQL Database is created and filled with schemas (+ data) from your SQL files.

7. Practice time
Use Azure Data Studio (Linux/Mac) or Sql Server Management Studio (Windows) to connect to Azure SQL and run your queries.

### Required module
You need the Az module to run the Azure SQL commands inside the PowerShell script.
Sample install command (run as admin):
Install-Module -Name Az -AllowClobber -Scope AllUsers -Force

### Other
I didn't add the SQL files to this repository, because they are part of this book:
https://www.microsoftpressstore.com/store/t-sql-fundamentals-9781509302000 > Downloads
Depending on your use case, you can straight away use TSQLV4.sql, or divide it into database creation + schema creation like I did.



