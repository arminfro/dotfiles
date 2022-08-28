---
id: {{ id }}
created: {{date now 'timestamp'}}
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
course: {{dir}}
aliases:
  - {{date now 'timestamp'}}
author: {{ extra.author }}
tags:
  - daily
  - {{ date now 'CW_%V/%y' }}
  - {{ date now '%B/%y' }}
---

# {{ date now "full" }}

## Tickets

- OL-
