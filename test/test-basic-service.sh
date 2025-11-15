#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CHART_DIR="$PROJECT_ROOT/basic-service"
EXAMPLE_VALUES="$CHART_DIR/example/member-service.yaml"

echo "Testing basic-service helm chart..."

# Check if helm is installed
if ! command -v helm &> /dev/null; then
    echo "Error: helm is not installed. Please install helm first."
    exit 1
fi

# Test 1: Lint the chart
echo "1. Running helm lint..."
helm lint "$CHART_DIR" || {
    echo "Error: helm lint failed"
    exit 1
}

# Test 2: Template with test values (since default values may have missing required fields)
TEST_VALUES="$SCRIPT_DIR/test-values-basic-service.yaml"
echo "2. Running helm template with test values..."
helm template test-release "$CHART_DIR" -f "$TEST_VALUES" > /dev/null || {
    echo "Error: helm template with test values failed"
    exit 1
}

# Test 3: Template with example values
if [ -f "$EXAMPLE_VALUES" ]; then
    echo "3. Running helm template with example values..."
    helm template test-release "$CHART_DIR" -f "$EXAMPLE_VALUES" > /dev/null || {
        echo "Error: helm template with example values failed"
        exit 1
    }
else
    echo "3. Skipping example values test (file not found: $EXAMPLE_VALUES)"
fi

# Note: helm lint and helm template are sufficient to validate chart correctness
# helm install --dry-run requires a Kubernetes cluster connection, which is not available in CI

echo "✓ All tests passed for basic-service chart!"

