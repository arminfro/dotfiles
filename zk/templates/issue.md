---
id: { { id } }
slug: { { env.ZK_BRANCH } }
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
created: { { format-date now 'timestamp' } }
course: { { dir } }
title: { { env.ZK_TITLE } }
aliases:
  - { { env.ZK_TITLE } }
  - { { format-date now 'timestamp' } }
author: { { env.ZK_NAME } }
tags:
  - { { dir } }
  - { { format-date now 'CW_%V/%y' } }
  - { { format-date now '%B/%y' } }
---

# {{env.ZK_TICKET_ID}} {{env.ZK_TITLE}} - {{env.ZK_POINTS}}

- [Ticket](https://{{env.ZK_JIRA_URL}}/browse/{{env.ZK_TICKET_ID}})
- [Pull Request](https://{{env.ZK_AZURE_URL}}/{{env.ZK_AZURE_PROJECT}}/_git/{{env.ZK_AZURE_REPO}}/pullrequest/)

{{env.ZK_DESCRIPTION}}

## Testing

{{env.ZK_TESTING}}

## Protocol

### [] Assign Ticket

```bash
jira issue assign {{env.ZK_TICKET_ID}} "{{env.ZK_EMAIL}}"
```

### [] Create Branch

```bash
git checkout -b feature/{{env.ZK_BRANCH}}
```

### [] Start Progress

```bash
jira issue move  {{env.ZK_TICKET_ID}} "In Progress"
```

### [] Find Problem

-

### [] Find Solution

-

### [] Commit & Push

```bash
git push --set-upstream origin feature/{{env.ZK_BRANCH}}
```

### [] Run tests locally

### [] create Pull Request

```bash
az repos pr create \
  --project {{env.ZK_AZURE_PROJECT}} \
  --auto-complete true \
  --source-branch feature/{{env.ZK_BRANCH}} \
  --target-branch develop \
  --title "{{env.ZK_TICKET_ID}} {{env.ZK_TITLE}}" \
  --sqash true
```

### [] wait for PR, set to 'Test'

```bash
jira issue move  {{env.ZK_TICKET_ID}} "In Test"
```

## Resources

-

## Daily Notes

{{ env.ZK_DAYS }}
