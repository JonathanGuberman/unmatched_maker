#!/usr/bin/env sh

# abort on errors
set -e

# get latest changes
git merge master -m "Merge from master"

# build
npm run build

# navigate into the build output directory
#cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

#git init
git add -A
git commit -m 'Build for gh-pages'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
#git push -f git@github.com:JonathanGuberman/unmatched_maker.git master:gh-pages

#cd -
git subtree push --prefix dist origin gh-pages
