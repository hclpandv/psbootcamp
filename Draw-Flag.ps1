Function Draw-Flag(){
    write-host "*************************************" -ForegroundColor Red
    write-host "*************************************" -ForegroundColor Red
    write-host "*************************************" -ForegroundColor Red
    write-host "*************************************" -ForegroundColor white
    write-host "*************************************" -ForegroundColor white
    write-host "*************************************" -ForegroundColor white
    write-host "*************************************" -ForegroundColor green
    write-host "*************************************" -ForegroundColor green
    write-host "*************************************" -ForegroundColor green
}

Function Blink-Message {
    param([String]$Message,[int]$Delay,[int]$Count,
       [ConsoleColor]$Color1,[ConsoleColor]$Color2)
    for($i = 0; $i -lt $Count; $i++) {
        Clear-Host
        $useColor = if( $i % 2 -eq 0 ) { $Color1 } else {$Color2 }
        Write-Host $Message -ForegroundColor $useColor
        Start-Sleep -Milliseconds $Delay
    }
}

Blink-Message -Message "Vande Matram!!!" -Delay 200 -Count 10 -Color1 Green -Color2 Red
