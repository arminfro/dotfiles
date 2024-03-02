---
id: { { id } }
slug: { { extra.branch } }
keywords: []
abstract: |
subtitle:
linkcolor: blue
pdf-engine: xelatex
pandoc_:
  - output: .pdf
  - toc: true
  - toc-depth: 6
  - lua-filter: diagram-generator.lua
header-includes:
  - |
    \usepackage[margins=raggedright]{floatrow}
created: { { format-date now 'timestamp' } }
course: { { dir } }
title: { { extra.title } }
aliases:
  - { { extra.title } }
  - { { format-date now 'timestamp' } }
author: { { extra.name } }
tags:
  - { { dir } }
  - { { extra.category } }
  - Version {{ extra.fix_version }}
  - { { extra.sprint } }
  - { { format-date now 'CW_%V/%y' } }
  - { { format-date now '%B/%y' } }
---

# {{extra.ticket_id}} {{extra.title}} - {{extra.story_points}}

- [{{extra.ticket_id}} {{extra.title}}](https://{{env.ZK_JIRA_URL}}/browse/{{extra.ticket_id}})
- [Pull Request](https://{{env.ZK_AZURE_URL}}/{{env.ZK_AZURE_PROJECT}}/_git/{{env.ZK_AZURE_REPO}}/pullrequest/)

{{extra.description}}

## Testing

{{extra.testing}}

## Protocol

### [] Assign Ticket

```bash
jira issue assign {{extra.ticket_id}} "{{env.ZK_EMAIL}}"
```

### [] Create Branch

```bash
git checkout -b feature/{{extra.branch}}
```

### [] Start Progress

```bash
jira issue move  {{extra.ticket_id}} "In Bearbeitung"
```

### [] Find Problem

-

### [] Find Solution

-

### [] Commit & Push

```bash
git push --set-upstream origin feature/{{extra.branch}}
```

### [] Run tests locally

### [] create Pull Request

```bash
az repos pr create \
  --repository {{env.ZK_AZURE_PROJECT}} \
  --project {{env.ZK_AZURE_PROJECT}} \
  --auto-complete true \
  --source-branch feature/{{extra.branch}} \
  --target-branch develop \
  --title "{{extra.ticket_id}} {{extra.title}}"
  --sqash true
```

### [] wait for PR, set to 'Test'

```bash
jira issue move  {{extra.ticket_id}} "In Test"
```

## Resources

-

## Daily Notes

{{ extra.days }}
