# Jekyll docker

```shell
docker run --name=jekyll_sh --label=jekyll --volume=$(pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 jekyll/jekyll sh
```

# Jekyll command


Install Gem dependencies
```shell
bundle install
```

Build site
```shell
bundle exec jekyll build
```

To build the site in production mode, before the build set JEKYLL_ENV variable
```shell
JEKYLL_ENV=production
```

Build and launch web server
```shell
bundle exec jekyll serve
```

Create draft
```shell
bundle exec jekyll draft "draft-filename"
```

Create publish draft
```shell
bundle exec jekyll publish _draft/title-of-draft.md
```

Create post
```shell
bundle exec jekyll post "title-of-post"
```

# Structure of post

```markdown

---
layout: post
title: "Title of post"
category: weapon or warframe
tag: tag is the name of warframe or weapon
---

![alt attrib]({{ 'image_name.jpg' | asset_path }})
```

# Publish site

 * Commit and push your changes in master branch
 * Build the site in production mode with previous command.
 * Switch the project to branch **gh-pages**
 * Remove all files except **_site** folder
 * Copy all files in _site to the root project path
 * Commit and push with the message "Update to <*sha1 of master commit*>"
