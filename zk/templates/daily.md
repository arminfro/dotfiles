---
id: { { id } }
created: { { date now 'timestamp' } }
course: { { dir } }
aliases:
  - { { date now 'timestamp' } }
author: { { extra.author } }
pandoc_:
  - output: .pdf
tags:
  - { { extra.tags } }
  - { { date now 'CW_%V/%y' } }
  - { { date now '%B/%y' } }
---

# {{ date now "full" }}

## Tickets

- OL-

## Clipboard History