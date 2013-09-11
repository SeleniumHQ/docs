#!/bin/bash
git log --format='%aN - %ae' | sort -u > AUTHORS
