---
id: { { id } }
slug: { { slug title } }
title: { { title } }
created: { { date now 'timestamp' } }
course: { { dir } }
aliases:
  - { { title } }
  - { { date now 'timestamp' } }
author: { { extra.author } }
pandoc_:
  - output: .pdf
tags:
  - { { extra.tags } }
---

# {{title}}

{{content}}

<!-- ## Links -->
