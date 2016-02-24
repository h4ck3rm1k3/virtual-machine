bootstrap : /usr/bin/emacs /usr/bin/git /usr/bin/pip3
	echo ok, are strapped

/usr/bin/emacs :
	sudo apt-get install emacs

/usr/bin/git :
	sudo apt-get install git

/usr/bin/pip3 :
	sudo apt-get install python3-pip

