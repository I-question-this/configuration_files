#!/bin/sh
# Completely removes all docker images and volumes
# Not the most delicate move, but it certainly free up your disk space
docker system prune -af
docker volume prune -f
