# Holmusk Tech Blog

[![MPL-2.0 license](https://img.shields.io/badge/license-MPL--2.0-blue.svg)](LICENSE)
[![Build status](https://secure.travis-ci.org/Holmusk/tech-blog.svg)](https://travis-ci.org/Holmusk/tech-blog)

Blog for Holmusk Tech Team

## How to build and run

1. Build backend:
   ```
   stack build
   ```
2. Run blog:
   ```
   stack run site rebuild
   stack run site watch
   ```
3. Open `localhost:8000`

## How to update and deploy this web page

The workflow is easy:

1. Make sure that you are on the latest develop branch
2. Create a new branch from develop, implement desired changes and open a pull request targetting develop branch
3. Deploy the updated web page content with the following command:
   ```
   ./scripts/deploy.sh "Some meaningful message"
   ```

## How to add a blog post

If you want to add a new post you should create a markdown file in the `blog/` folder. The name of this file should contain the date of the post and some name. For example: `2018-11-05-cool-post.md`.

In the `.md` file you should add next info in the following format:

```
---
title: Some really meaningful title that will appear at the page
author: Some cool person's name
github: That person's github account, if they have one
description: Some short description
tags: haskell, stack, cabal, build-tools, tutorial
---

DO NOT COPY TITLE HERE!
Here comes the body of the post itself
...
```

## Converting blogposts from various sources

**Note: Please [build and run](how-to-build-and-run) to verify your changes locally before deploying.**

#### docx

You can use `pandoc` to do conversion:

``` sh
pandoc <filename>.docx -o <filename>.md
```

Embedded images may be found by unzipping the document archive:

``` sh
> unzip <filename>.docx -d /tmp/<filename>

> ls /tmp/<filename>
...
inflating: /tmp/pr/word/media/image1.png
inflating: /tmp/pr/word/media/image2.jpg
inflating: /tmp/pr/word/media/image3.jpg
```

#### Notion

You can export the blogpost as `md`. 
Navigate to blog post's page in Notion, click the ellipsis menu in the top-right corner and select 'Export'.
