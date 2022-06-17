#!/bin/bash

if [[ -v $ZK_NOTEBOOK_DIR ]]; then
  if [[ ! -e $ZK_NOTEBOOK_DIR ]]; then
      mkdir "$ZK_NOTEBOOK_DIR"
  fi
  if [[ ! -d $ZK_NOTEBOOK_DIR/.zk ]]; then
    mkdir "$ZK_NOTEBOOK_DIR/.zk"
  fi
  ln -s ./config.toml "$ZK_NOTEBOOK_DIR/.zk"
  if [[ ! -d $ZK_NOTEBOOK_DIR/.zk/templates ]]; then
    mkdir "$ZK_NOTEBOOK_DIR/.zk/templates"
  fi
  ln -s ./templates/task.md "$ZK_NOTEBOOK_DIR/.zk/templates"
  ln -s ./templates/daily.md "$ZK_NOTEBOOK_DIR/.zk/templates"
  ln -s ./templates/issue.md "$ZK_NOTEBOOK_DIR/.zk/templates"
  ln -s ./templates/default.md "$ZK_NOTEBOOK_DIR/.zk/templates"

  if [[ ! -d $ZK_NOTEBOOK_DIR/media ]]; then
    mkdir "$ZK_NOTEBOOK_DIR/media"
  fi
  if [[ ! -d $ZK_NOTEBOOK_DIR/media/imgs ]]; then
    mkdir "$ZK_NOTEBOOK_DIR/media/imgs"
  fi
else
  echo 'No ZK_NOTEBOOK_DIR environment var found'
fi
