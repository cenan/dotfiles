#!/bin/bash

# Script to group files into subdirectories based on the first 2 characters of their filename
# Efficiently handles directories with millions of files

set -euo pipefail

# Default values
SOURCE_DIR="${1:-.}"
REPORT_FILE="files-report.txt"
DRY_RUN="${DRY_RUN:-false}"

# Check if source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Error: Directory '$SOURCE_DIR' does not exist." >&2
    exit 1
fi

# Convert to absolute path
SOURCE_DIR="$(cd "$SOURCE_DIR" && pwd)"

echo "Processing files in: $SOURCE_DIR"
echo "Report will be saved to: $SOURCE_DIR/$REPORT_FILE"

if [[ "$DRY_RUN" == "true" ]]; then
    echo "DRY RUN MODE - No files will be moved"
fi

# Declare an associative array to hold counts
declare -A dir_counts

# Counter for progress
processed=0

# Function to get prefix (first 2 characters, lowercase for consistency)
get_prefix() {
    local filename="$1"
    # Extract first 2 characters, convert to lowercase for grouping
    local prefix="${filename:0:2}"
    echo "$prefix" | tr '[:upper:]' '[:lower:]'
}

# Function to move a file to its destination
process_file() {
    local file="$1"
    local filename
    filename="$(basename "$file")"
    
    # Get the prefix (first 2 chars)
    local prefix
    prefix=$(get_prefix "$filename")
    
    # Validate prefix (only allow alphanumeric, otherwise use 'other')
    if [[ ! "$prefix" =~ ^[a-zA-Z0-9]{2}$ ]]; then
        prefix="other"
    fi
    
    local dest_dir="$SOURCE_DIR/$prefix"
    local dest_file="$dest_dir/$filename"
    
    # Check for name collision
    if [[ -e "$dest_file" && "$file" != "$dest_file" ]]; then
        # Generate unique name
        local base="${filename%.*}"
        local ext=""
        [[ "$filename" == *.* ]] && ext=".${filename##*.}"
        local counter=1
        while [[ -e "$dest_file" ]]; do
            dest_file="$dest_dir/${base}_${counter}${ext}"
            counter=$((counter + 1))
        done
        echo "  Name collision resolved: $filename -> $(basename "$dest_file")"
    fi
    
    if [[ "$DRY_RUN" == "true" ]]; then
        echo "  Would move: $filename -> $prefix/"
    else
        # Create destination directory if it doesn't exist
        if [[ ! -d "$dest_dir" ]]; then
            mkdir -p "$dest_dir"
        fi
        
        # Move the file (only if source != destination)
        if [[ "$file" != "$dest_file" ]]; then
            mv -f "$file" "$dest_file"
        fi
    fi
    
    # Update count
    dir_counts["$prefix"]=$((${dir_counts["$prefix"]:-0} + 1))
    
    # Progress indicator
    processed=$((processed + 1))
    if (( processed % 10000 == 0 )); then
        echo "  Processed: $processed files..."
    fi
}

# Export functions and variables for use with find
export -f get_prefix process_file
export SOURCE_DIR DRY_RUN

# Process files using find with -exec for efficiency
echo "Starting file processing..."

# Use find to process files in batches
# We use a while loop to process each file
while IFS= read -r -d '' file; do
    process_file "$file"
done < <(find "$SOURCE_DIR" -maxdepth 1 -type f -print0)

echo ""
echo "========================================"
echo "Processing complete!"
echo "Total files processed: $processed"
echo ""

# Generate report
echo "Generating report..."
{
    echo "File Grouping Report"
    echo "===================="
    echo "Source Directory: $SOURCE_DIR"
    echo "Generated: $(date)"
    echo "Total Files Processed: $processed"
    echo ""
    echo "Files per subdirectory:"
    echo "------------------------"
    
    # Sort by prefix
    for prefix in "${!dir_counts[@]}"; do
        printf "  %-10s: %d files\n" "$prefix/" "${dir_counts[$prefix]}"
    done | sort
    
    echo ""
    echo "Subdirectories created:"
    echo "------------------------"
    for prefix in "${!dir_counts[@]}"; do
        echo "  $prefix/"
    done | sort
    
} > "$SOURCE_DIR/$REPORT_FILE"

echo "Report saved to: $SOURCE_DIR/$REPORT_FILE"

# Display summary
echo ""
echo "Summary:"
cat "$SOURCE_DIR/$REPORT_FILE"
