for filename in `ls tmp/pids/*.pid`

do
	kill -9 `cat $filename`
	
done

rm -fr tmp/pids/*.pid
