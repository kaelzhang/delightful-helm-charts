#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=========================================="
echo "Running all helm chart tests"
echo "=========================================="
echo ""

# Test basic-service
echo "Testing basic-service chart..."
echo "----------------------------------------"
"$SCRIPT_DIR/test-basic-service.sh"
echo ""

# Test external-service
echo "Testing external-service chart..."
echo "----------------------------------------"
"$SCRIPT_DIR/test-external-service.sh"
echo ""

echo "=========================================="
echo "✓ All tests passed!"
echo "=========================================="

