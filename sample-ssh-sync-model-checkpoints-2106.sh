#@STCGoal Sync models checkpoints from one computer to another from another
#for c in 225 240 255 270 285; do echo $c;ssh jgi@as "cd $mp;tar cf - *$c*"  | ssh jgi@orko "mkdir -p $mp;cd $mp ; tar xvf -"; done

m=model_gia-ds-Inktobers-v01-210611-864x_new
mp=/a/model/models/$m/checkpoint_long
for c in 465 480 495; do ch=$c'000'; ssh jgi@as "cd $mp;tar cf - *$ch*"  | ssh jgi@orko "cd $mp && tar xvf -" ;done

