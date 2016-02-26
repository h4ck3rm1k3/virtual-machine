bootstrap : /usr/bin/emacs \
	/usr/bin/git       \
	/usr/bin/pip3      \
	~/.emacs.d/
	echo ok, are strapped

/bin/dash :
	sudo apt-get install dash

/usr/bin/emacs :
	sudo apt-get install emacs

/usr/bin/git :
	sudo apt-get install git

/usr/bin/pip3 :
	sudo apt-get build-dep python3-pip
	sudo easy_install3 pip
	sudo pip3 install -r requirements.txt  --upgrade

~/.emacs.d/ :
	git clone git@github.com:h4ck3rm1k3/emacs.d.git ~/.emacs.d

pip : s3cmd open-everything-library
	sudo pip3 install -r requirements.txt

s3cmd :
	git clone git@github.com:h4ck3rm1k3/s3cmd.git

open-everything-library:
	git clone git@github.com:h4ck3rm1k3/open-everything-library.git python-duckduckgo

deps : PyOrgMode yacybot Wikipedia extraction opensearch  other

PyOrgMode:
	git clone git@github.com:h4ck3rm1k3/PyOrgMode.git

Wikipedia:
	git clone git@github.com:h4ck3rm1k3/Wikipedia.git

extraction:
	git clone git@github.com:h4ck3rm1k3/extraction.git

opensearch:
	git clone git@github.com:h4ck3rm1k3/opensearch.git

python-duckduckgo:
	git clone git@github.com:h4ck3rm1k3/python-duckduckgo.git

yacybot:
	git clone git@github.com:h4ck3rm1k3/yacybot.git


other :
	git clone git@github.com:h4ck3rm1k3/sparql-client.git || echo 0
	git clone git@github.com:h4ck3rm1k3/ia-wrapper.git internetarchive || echo 0
	git clone git@github.com:h4ck3rm1k3/rdflib.git|| echo 0
	git clone git@github.com:h4ck3rm1k3/sparqlwrapper.git|| echo 0
	git clone git@github.com:speedydeletion/pywikibot.git speedy_deletion_bot|| echo 0
	git clone git@github.com:h4ck3rm1k3/pywikipediabot.git|| echo 0
	git clone git@github.com:h4ck3rm1k3/pywikibot-wikibase.git|| echo 0
	git clone git@github.com:wikimedia/pywikibot-core.git|| echo 0
	git clone git@github.com:h4ck3rm1k3/i18n.git|| echo 0
	git clone git@github.com:h4ck3rm1k3/requests.git || echo 0
	git clone git@github.com:h4ck3rm1k3/eventlet.git|| echo 0
	git clone git@github.com:h4ck3rm1k3/nltk.git|| echo 0

pull: pull-internetarchive pull-rdflib pull-eventlet pull-i18n pull-requests pull-sparqlwrapper pull-nltk
	echo	pass


pull-nltk:
	cd nltk && git remote add original git@github.com:nltk/nltk.git || echo done
	cd nltk && git pull original develop
	cd nltk && git push origin develop


pull-rdflib:
	cd rdflib && git remote set-url original git@github.com:RDFLib/rdflib.git || echo done
	cd rdflib && git pull original master
	cd rdflib && git push origin master

pull-internetarchive:
	cd internetarchive && git remote add original git@github.com:jjjake/internetarchive.git || echo done
	cd internetarchive && git pull original master
	cd internetarchive && git push origin master

pull-eventlet:
	cd eventlet && git remote add original git@github.com:eventlet/eventlet.git || echo ok
	cd eventlet && git pull original master
	cd eventlet && git push origin master

pull-i18n:
	cd i18n && git remote add original https://gerrit.wikimedia.org/r/p/pywikibot/i18n.git || echo ok 
	cd i18n && git pull original master
	cd i18n && git push origin master

pull-requests:
	cd requests && git remote add original git@github.com:kennethreitz/requests.git || echo ok
	cd requests && git pull original master
	cd requests && git push origin master

pull-sparqlwrapper:
	cd sparqlwrapper && git remote add original git@github.com:RDFLib/sparqlwrapper.git || echo ok 
	cd sparqlwrapper && git pull original master
	cd sparqlwrapper && git push origin master


nltkdata:
	sudo python -m nltk.downloader -d /usr/local/share/nltk_data all

install_pip:
	pip3 install -r requirements.txt  --user --upgrade
