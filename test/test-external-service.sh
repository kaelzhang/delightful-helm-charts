#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CHART_DIR="$PROJECT_ROOT/external-service"
EXAMPLE_VALUES="$CHART_DIR/example/values.yaml"

echo "Testing external-service helm chart..."

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

# Test 2: Template with test values (since default values may be empty)
TEST_VALUES="$SCRIPT_DIR/test-values-external-service.yaml"
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

# Test 4: Dry-run install with test values
echo "4. Running helm install --dry-run with test values..."
helm install test-release "$CHART_DIR" -f "$TEST_VALUES" --dry-run --debug > /dev/null || {
    echo "Error: helm install --dry-run with test values failed"
    exit 1
}

# Test 5: Dry-run install with example values
if [ -f "$EXAMPLE_VALUES" ]; then
    echo "5. Running helm install --dry-run with example values..."
    helm install test-release "$CHART_DIR" -f "$EXAMPLE_VALUES" --dry-run --debug > /dev/null || {
        echo "Error: helm install --dry-run with example values failed"
        exit 1
    }
else
    echo "5. Skipping example values dry-run test (file not found: $EXAMPLE_VALUES)"
fi

echo "✓ All tests passed for external-service chart!"

