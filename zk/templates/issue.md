---
id: { { id } }
slug: { { title } }
keywords: []
abstract: |
subtitle:
linkcolor: blue
pdf-engine: xelatex
pandoc_:
  - output: .pdf
  - toc: true
  - toc-depth: 6
header-includes:
  - |
    \usepackage[margins=raggedright]{floatrow}
title: { { title } }
created: { { format-date now 'timestamp' } }
course: { { dir } }
aliases:
  - { { title } }
  - { { format-date now 'timestamp' } }
author: { { extra.author } }
tags:
  - { { title } }
  - { { dir } }
  - { { format-date now 'CW_%V/%y' } }
  - { { format-date now '%B/%y' } }
---

# {{title}} {{extra.branch}}

## Links

- [Ticket](https://jira.sageinternal.de/browse/{{title}})
- [Branch](https://tfs-de.sageinternal.de/SMB/SBC%20WebClient/_git/SBC-WebClient?fix%2F{{title}}_{{slug extra.branch}})
- [Pull Request](https://tfs-de.sageinternal.de/SMB/SBC%20WebClient/_git/SBC-WebClient/pullrequest/)

## Procedure

- [] Assign Ticket
- [] Start Progress
- [] Find Problem
  - Description:
- [] Find Solution
  - Description:
- [] Commit & Push
  - [] check if Ticket has version
  - [] (optioal) run tests locally
- [] create Pull Request
  - [] (optioal) enter nr in link
- [] wait for PR, set to 'Test'

## Git status

```sh
# :r !git status --short
```

## Git diff

```sh
# :r !git diff
```

## Scripts

```sh
git checkout -b fix/{{title}}_{{slug extra.branch}}
# git add .
# git commit -m '' # -m ''
git push origin fix/{{title}}_{{slug extra.branch}}
```
