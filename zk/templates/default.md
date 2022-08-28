---
id: {{ id }}
slug: {{ slug title }}
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
created: {{ date now 'timestamp' }}
course: {{dir}}
title: {{title}}
aliases:
  - {{title}}
  - {{date now 'timestamp'}}
tags:
  - {{ date now 'CW_%V/%y' }}
  - {{ date now '%B/%y' }}
---

# {{title}}

{{content}}
