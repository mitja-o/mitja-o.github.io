.PHONY: dist
dist: ./src
	rm -rf ./dist
	mkdir -p ./dist
	cp -r ./src/* ./dist/

minify-css: dist ./src/css/skeleton.css
	npx --yes uglifycss ./src/css/skeleton.css --output ./dist/css/skeleton.min.css
	sed "s/skeleton\.css/skeleton\.min\.css/" ./dist/index.html > ./dist/index.tmp.html
	mv ./dist/index.tmp.html ./dist/index.html 	

minify-html: dist minify-css
	npx --yes htmlnano ./dist/index.html -o ./dist/index.html

minify: minify-html

pub: minify
