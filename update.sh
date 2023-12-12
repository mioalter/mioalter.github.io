git checkout develop -- _site/
cp _site/about.html about.html
cp _site/archive.html archive.html
cp _site/contact.html contact.html
cp _site/index.html index.html
cp -r _site/css/ css/
cp -r _site/images/ images/
cp -r _site/posts/ posts/
rm -rf _site/
git rm -r _site/
git add -A

