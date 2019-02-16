#!/bin/bash

docker build . -t postgres-9.6

docker images |grep postgres-9.6

