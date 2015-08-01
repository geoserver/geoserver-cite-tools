#!/bin/bash

#  build the tools
git submodule update
ant clean build
