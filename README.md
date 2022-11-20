# How To

first
* start a new branch off of `develop`
* make changes
* make a PR
* merge into `develop`

then
* switch to `develop` and pull
* checkout a new branch off of `master`
* run the `update.sh` script, this _should_
  * checkout the `_site/` directory from develop
  * copy the files in there to the correct places
  * remove the `_site/` directory
  * `git add -A` to add all of the files
* commit those changes and make a pr
