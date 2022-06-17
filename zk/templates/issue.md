---
id: {{ id }}
slug: {{ slug title }}
created: {{ date now 'timestamp' }}
title: {{title}}
created: {{date now 'timestamp'}}
course: {{dir}}
aliases:
  - {{title}}
  - {{date now 'timestamp'}}
author: {{ extra.author }}
tags:
  - {{ dir }}
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

### Create and checkout branch

```sh
git checkout -b {{extra.branch}}
```

### Push branch

```sh
# git add .
# git commit -m '' # -m ''
git push origin {{extra.branch}}
```
