for file in m*
do
	perl -nle '$x=scalar(split(" ",$_)); push @a,$x; $sum += $x; END{ print " & ", $ARGV, " & " , scalar(@a)," & ",$sum/scalar(@a) }' $file
done
