---
id: {{ id }}
slug: {{ slug title }}
title: {{ title }}
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
aliases:
  - {{ title }}
  - {{ format-date now 'timestamp' }}
author: {{ env.ZK_NAME }}
tags:
  - {{ dir }}
  - {{ format-date now 'CW_%V/%y' }}
  - {{ format-date now '%B/%y' }}
---

# Task: {{title}}

## What needs to be done

-

## Why it needs to be done

-

## Acceptance Criteria

- Given precondition
- When action
- Then result

## Additional Information
