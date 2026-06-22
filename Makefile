# kafu — build & publish the 花譜 blog.
# Content is delivered into content/ by ling-ling (`make blog` over there);
# this repo never reaches back into ling-ling.
#
#   make preview   build, then serve at http://localhost:8080 (handles clean URLs)
#   make build     build content/ -> public/
#   make publish   commit delivered content + push (GitHub Action deploys it)

SHELL := /bin/bash
NODE := . $$HOME/.nvm/nvm.sh && nvm use 22 >/dev/null

build:
	$(NODE) && npx quartz build

preview: build
	$(NODE) && npx serve public -l 8080

publish:
	git add content && git commit -m "Publish: update blog" || true
	git push origin v4

.PHONY: build preview publish
