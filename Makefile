publish:
	npm run build-prod
	git checkout -b gh-pages
	git checkout master -- public
	cp public/* .
	git add --all .
	git commit -m "New release"
	git push origin gh-pages
	git checkout master
