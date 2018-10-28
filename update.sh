git checkout develop -- _site/
cp -a _site/ .
rm -rf _site/
git commit -am "update posts"
