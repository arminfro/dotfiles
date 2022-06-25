---
id: { { id } }
slug: { { slug title } }
title: { { title } }
created: { { date now 'timestamp' } }
course: { { dir } }
aliases:
  - { { title } }
  - { { date now 'timestamp' } }
author: { { extra.author } }
pandoc_:
  - output: .pdf
tags:
  - { { dir } }
---

# {{title}}

## Links

- ticket-url/{{slug title}}
- branch-url/{{extra.branch}}
- pr-url

## Notes

<!-- ### Environment -->
<!-- ### Precondition -->
<!-- ### Steps to reproduce -->
<!-- ### Current behavior -->
<!-- ### Expected behavior -->

## Scripts

```sh
git checkout -b {{extra.branch}}
# git add .
# git commit -m '' # -m ''
git push origin {{extra.branch}}
```