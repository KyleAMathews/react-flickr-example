publish:
	git checkout gh-pages
	git checkout master -- public
	cp public/* .
	git add --all .
	git commit -m "New release"
	git push origin gh-pages
	git checkout master
