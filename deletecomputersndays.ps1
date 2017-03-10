#This queries for the current date.
$date = Get-Date

#This is where you can set your days since last connection. The default set in this script is 60 days.
$n = $date.AddDays(-60)

#Remember to define your search base for your domain.
Get-ADComputer -Filter {LastLogonDate -le $n} -Properties * -SearchBase "ou=Users,dc=contoso,dc=com" | Remove-ADComputer -Confirm