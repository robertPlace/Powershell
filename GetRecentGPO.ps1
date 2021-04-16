Get-GPO -all | Sort ModificationTime -Descending | Select -First 20 | FT DisplayName, ModificationTime
