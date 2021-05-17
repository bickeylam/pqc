
$sqlServer = "."
$database = "mytester"

# IF (!(Get-Module -Name sqlps)) {
#     Write-Host 'Loading SQLPS Module' -ForegroundColor DarkYellow
#     Push-Location
#     Import-Module sqlps -DisableNameChecking
#     Pop-Location
# }
  
$localScriptRoot = $PSScriptRoot
$scripts = Get-ChildItem $localScriptRoot | Where-Object { $_.Extension -eq ".sql" }
foreach ($script in $scripts) {
    Write-Host "Running Script : " $script.Name #-BackgroundColor DarkGreen -ForegroundColor White
    Invoke-Sqlcmd -ServerInstance $sqlServer -Database $database -InputFile $script.FullName
}

# $SqlDrop = "DROP TABLE IF EXISTS $Table"
# $SqlCreate = "CREATE TABLE $Table ([ApplicationOnlineID] [int], [CreatedAt] [datetime])"
# $SqlInsert = 'INSERT INTO [ApplicationOnline] ([CreatedAt]) VALUES (GetDate())'
# $SqlUpdate = 'UPDATE [ApplicatioinOnline] SET [] WHERE []=1'
# $SqlDelete = 'DELETE FROM [ApplicationOnline] WHERE []=1'
# $SqlSelect = 'SELECT * FROM [ApplicationOnline]'
# Invoke-Sqlcmd -ServerInstance $sqlServer -Database $database -Query $SqlDrop
# Invoke-Sqlcmd -ServerInstance $sqlServer -Database $database -InputFile '01_CreateApplicationOnline.sql'