
#file ext
for f in *PNG ; do ff=${f%.*};mv "$f" "$ff.png"; done
for f in *JPG ; do ff=${f%.*};mv "$f" "$ff.jpg"; done
export mvcmd="git mv"
export mvcmd="mv"
#spaces
for f in * ; do ($mvcmd "$f" "$(echo $f| tr ' ' '_')" || mv "$f" "$(echo $f| tr ' ' '_')"); done

#clean fn of patterns
for f in * ; do ($mvcmd "$f" "$(echo $f| sed -e 's/_-_/__/g')" || mv "$f" "$(echo $f| sed -e 's/_-_/__/g')" ) &> /dev/null; done
for f in * ; do ($mvcmd "$f" "$(echo $f| sed -e 's/_-/-/g')" || mv "$f" "$(echo $f| sed -e 's/_-/-/g')" )&> /dev/null; done
