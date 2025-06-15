# Imposta gli ID evento da cercare
$eventIDs = @(6005, 6006, 6008)

# Recupera eventi dal registro di sistema
$events = Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    ID = $eventIDs
} | Sort-Object TimeCreated -Descending

$events | Select-Object TimeCreated, ID, Message | Format-Table -AutoSize
Write-Host "`nPremi INVIO per uscire..." -ForegroundColor Yellow
Read-Host