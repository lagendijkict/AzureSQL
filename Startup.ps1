#Variables
$resourcegroup= $args[0]
$databaseName = "TSQLV4"
$serverName = "sqlpractice"
$adminSqlLogin = "sqladmin"
$password = "Secure password"
$ip = "Your local IP address"
$location = "Your Azure region"

$pathToCreateDbScript = "path to folder/createdb.sql"
$pathToCreateSchemasScript = "path to folder/create schema.sql"

Connect-AzAccount

Write-Output("You are logged in.")

#Create server
New-AzSqlServer -ResourceGroupName $resourcegroup -ServerName $serverName -Location $location -SqlAdministratorCredentials $(New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $adminSqlLogin, $(ConvertTo-SecureString -String $password -AsPlainText -Force))

#Allow connection from client
New-AzSqlServerFirewallRule -FirewallRuleName "letmein" -StartIpAddress $ip -EndIpAddress $ip -ServerName $serverName -ResourceGroupName $resourcegroup

#Create T-SQL Fundamentals resources 1 of 2
Invoke-SqlCmd -ServerInstance sqlpractice.database.windows.net -InputFile $pathToCreateDbScript -Username $adminSqlLogin -Password $password 

#Resources 2 of 2
Invoke-SqlCmd -ServerInstance sqlpractice.database.windows.net -Database $databaseName -InputFile $pathToCreateSchemasScript -Username $adminSqlLogin -Password $password 

