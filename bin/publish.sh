#!/usr/bin/env bash

tmp="/tmp"

npm install .
npm run build
git add out
git commit -m "Updating binaries"
git push origin 1.2

rm -rf "$tmp/cell-viz"
cp -r out "$tmp/cell-viz"

git checkout gh-pages

cp "$tmp/cell-viz/*" bin/.

git add bin

git commit -m "Publishing latest to gh-pages"
git push origin gh-pages
git push upstream gh-pages

git checkout 1.2
