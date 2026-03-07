#!/bin/bash

# Configuration
FORMAT="mermaid" # Can be plantuml, mermaid, dot, etc.

# Run Structurizr CLI to export
docker run --rm -v $(pwd):/usr/local/structurizr structurizr/cli \
    export -workspace workspace.dsl -format $FORMAT -output diagrams
