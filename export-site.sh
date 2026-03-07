#!/bin/bash

# Ensure output directory exists
mkdir -p static

echo "Exporting workspace to static site..."

# Run Structurizr CLI to export as a static site
docker run --rm -v $(pwd):/usr/local/structurizr structurizr/cli \
    export -workspace workspace.dsl -format static -output static

echo "Done! You can open 'static/index.html' in your browser."
