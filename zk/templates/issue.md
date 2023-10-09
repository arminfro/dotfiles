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

# {{extra.ticket_id}} {{extra.summary}}

{{extra.desc}}

## Links

- [Ticket](https://myurl.atlassian.net/browse/{{extra.ticket_id}})
- [Pull Request](https://myurl.visualstudio.com/Project/_git/Project/pullrequest/)

## Procedure

### [] Assign Ticket

```bash
jira issue assign {{extra.ticket_id}} "my@email.com"
```

### [] Create Branch

```bash
git checkout -b feature/{{extra.ticket_id}}_{{slug extra.summary}}
```

### [] Start Progress

```bash
jira issue move  {{extra.ticket_id}} "In Progress"
```

### [] Find Problem

### [] Find Solution

### [] Commit & Push

```bash
git push --set-upstream origin feature/{{extra.ticket_id}}_{{slug extra.summary}}
```

### [] Run tests locally

### [] create Pull Request

```bash
az repos pr create \
  --project Everest \
  --auto-complete true \
  --source-branch feature/{{extra.ticket_id}}_{{slug extra.summary}} \
  --target-branch develop \
  --title "{{extra.ticket_id}} {{extra.summary}}" \
  --sqash true
```

### [] wait for PR, set to 'Test'

```bash
jira issue move  {{extra.ticket_id}} "In Test"
```

## Notes and Observation

## Scripts

```sh
:r !git status --short
:r !git diff
```
