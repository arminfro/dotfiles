---
id: { { id } }
slug: { { slug title } }
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
title: { { title } }
aliases:
  - { { title } }
  - { { format-date now 'timestamp' } }
tags:
  - { { format-date now 'CW_%V/%y' } }
  - { { format-date now '%B/%y' } }
---

# {{title}}

{{content}}
