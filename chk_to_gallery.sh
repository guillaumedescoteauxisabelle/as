 #!/bin/bash

 chk=240k
 for f in $(du -a | grep $chk | awk '// { print $2 $3 $4 }'); do 
  echo '![]('$f')' 
done