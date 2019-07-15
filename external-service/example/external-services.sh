#!/usr/bin/env bash

helm install \
  --dry-run --debug \
  --values ./values.yaml \
  ../
