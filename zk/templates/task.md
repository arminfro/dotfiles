---
id: {{ id }}
slug: {{ slug title }}
title: {{title}}
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
created: {{date now 'timestamp'}}
course: {{dir}}
aliases:
  - {{title}}
  - {{date now 'timestamp'}}
author: {{ extra.author }}
tags:
  - {{ extra.tags }}
  - {{ dir }}
  - {{ date now 'CW_%V/%y' }}
  - {{ date now '%B/%y' }}
---

# Task: {{ title }}

## What needs to be done

-

## Why it needs to be done

-

## Acceptance Criteria

- ## **Given** precondition
- ## **When** action
- ## **Then** result

## Additional Information
