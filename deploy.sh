cp -r site/* ../wangkingkingking.github.io
cd ../wangkingkingking.github.io
mkdocs gh-deploy --config-file ../blog/mkdocs.yml --remote-branch master
