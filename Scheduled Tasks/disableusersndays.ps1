#Set days since last login, default in this script is 30.
$timespan = New-Timespan -Days 30

#Set log path, please change it from the root of C:.
$logpath = "C:\"

#Set User OU.
$UsersOU = "ou=Users,dc=contoso,dc=com"

#Get usernames
$InactiveUsers = Search-ADAccount -UsersOnly -AccountInactive -SearchBase $UsersOU -TimeSpan $timespan

#Write logs
$InactiveUsers | Out-File "$logpath\Disabled Third Party $(get-date -f yyyy-MM-dd).txt"

#Disable users
$InactiveUsers | Disable-ADAccount

#If you would like to then move your disabled users, uncomment these lines.
#$InactiveUsersOU = "ou=Inactive Users,dc=contoso,dc=com"
#Search-ADAccount -AccountDisabled -SearchBase $UsersOU | Move-ADObject -TargetPath $InactiveUsersOU