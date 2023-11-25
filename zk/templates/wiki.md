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
  - lua-filter: diagram-generator.lua
header-includes:
  - |
    \usepackage[margins=raggedright]{floatrow}
created: {{ format-date now 'timestamp' }}
course: {{ dir }}
title: {{ title }}
author: {{ env.ZK_NAME }}
aliases:
  - {{ title }}
  - {{ format-date now 'timestamp' }}
tags:
  - {{ extra.tags }}
  - {{ dir }}
  - {{ format-date now 'CW_%V/%y' }}
  - {{ format-date now '%B/%y' }}
---

# {{title}}

## Ressources

##

