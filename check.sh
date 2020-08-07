#! /bin/bash

if (( `checkupdates | wc -l` >= "1" ));
then 
	echo "Updates are avaliable"
else
	echo "No Updates avaliable"
fi

