#!/bin/sh
echo ""
echo "  marimo notebook → http://localhost:2718"
echo ""
exec marimo edit \
  --host 0.0.0.0 \
  --port 2718 \
  --no-token \
  marimo-playground/notebooks/unitycatalog-delta.py

## NOTE: wip, don't start yet
# marimo-playground/notebooks/delta-uc-blog.py
