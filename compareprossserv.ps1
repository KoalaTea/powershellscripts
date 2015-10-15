
if(Test-Path process2.txt){
	Remove-Item process2.txt
	Get-Process | Out-File process2.txt
}else{
	Get-Process | Out-File process2.txt
}
if(Test-Path service2.txt){
	Remove-Item service2.txt
	Get-Service | Out-File service2.txt
}else{
	Get-Process | Out-File service2.txt
}

#to test
$ref = Get-Content 'serivice.txt'

(Get-Content 'service2.txt') |
  ? { $ref -notcontains $_ } |
  Set-Content 'service2.txt'
  
#found online? look over
#$DeploymentGroupList = get-content $Inputfile $DeploymentGroupList += Get-Content $workingfile $DeploymentGroupList = $DeploymentGroupList | Sort Name $Exceptions = Get-Content $workingfile $List = @() foreach ($DeploymentGroup in $DeploymentGroupList){ if($Exceptions -contains $DeploymentGroup){ #Skip } else{ $List += $DeploymentGroup } } # Creating a final list of groups to be imported $List > $FinalGroup