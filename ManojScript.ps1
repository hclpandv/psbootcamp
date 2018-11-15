<#
  IDEA : To Convert an XLS file into another with modified fields
  INSTRUCTIONS : Please open the XLS file in MsExcel, delete the first row and save it as csv. the execute this script.
                 Modify the input csv and output csv file path accordingly 

#>

$inputCsvFile = "C:\Temp\Process Automation_ORI extract.csv"
$outputCsvFile = "C:\Temp\New_Manoj.csv"

$csv_content = import-csv $inputCsvFile -Delimiter ";" | ForEach-Object {
   if($_.State -contains "To Do"){
      $_.State = "New"
   }
   $_
}

$csv_content | select ID, Title, 'Work Item Type', State, Reason, 'Assigned To' | Export-Csv $outputCsvFile -NoTypeInformation
Import-Csv $outputCsvFile | ft
