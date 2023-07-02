#!/bin/bash

echo "Build postgress database container..."
bash postgress-run-container.sh
echo "Database migration.."
bash migration-bootstrap.sh
echo "Build kong container..."
bash kong-run-container.sh
echo "Kong migration..."
bash migration-kong.sh
echo "Build konga dashboard kontainer..."
bash dashboard-konga-run-container.sh