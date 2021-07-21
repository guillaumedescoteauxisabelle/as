 #!/bin/bash

#@STCGoal Specified Checkpoints
 chk=$1
 outf=$2
for f in $(du -a | grep $chk | awk '// { print $2 $3 $4 }')
  do 
  echo '![]('$f')' 
  echo $"\n----\n"
done

