echo "Counting line of code"
(Get-ChildItem -Exclude Lib,packages,.\AFRem\,.\Experiments\,.\STCWebAPI.*,Backup,*Release*,*Debug*,*binDebug*,bin,PSTemplates,Sample,Dist,Reponts | gci -exclude *.Designer.*,*Generated*.cs -include *.cs  -recurse | select-string .).Count 

