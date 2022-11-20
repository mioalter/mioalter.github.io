git checkout develop
git pull
git checkout master
git checkout develop -- _site/
cp _site/about.html about.html
cp _site/archive.html archive.html
cp _site/contact.html contact.html
cp _site/index.html index.html
cp -r _site/css/ .
cp -r _site/posts/ .
rm -rf _site/
git rm -r _site/

