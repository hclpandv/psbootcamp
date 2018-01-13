$age = Read-Host "Please enter your age?"
$gender = Read-Host "Please Enter your Gender i.e. M/F"

if($gender -eq "F")
{

        if ($age -gt 18)
        {
            Write-Host "You are allowed to marry"
        }

        else
        {
            Write-Host "You are not allowed to marry"
        }

}
else
{


        if ($age -gt 21)
        {
            Write-Host "You are allowed to marry"
        }

        else
        {
            Write-Host "You are not allowed to marry"
        }


}