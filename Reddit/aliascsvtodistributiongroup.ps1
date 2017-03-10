$group = get-distributiongroup “GroupName”
Import-Csv Letter:\Path\aliaslist.csv |
ForEach {set-distributiongroup -Identity $group -EmailAddresses @{Add= $_.email}}