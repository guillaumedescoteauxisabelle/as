#@STCGoal Sync models checkpoints from one computer to another from another
for c in 225 240 255 270 285; do echo $c;ssh jgi@as "cd $mp;tar cf - *$c*"  | ssh jgi@orko "mkdir -p $mp;cd $mp ; tar xvf -"; done

