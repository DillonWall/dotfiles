#! /usr/bin/bash
# Debug version - shows what it would do
# # Remove trailing slashes from symlink targets (cosmetic fix)
for f in *; do
    if [ -L "$f" ]; then
        target=$(readlink "$f")
        # Check if target ends with exactly one slash (and isn't just "/")
        if [[ "$target" == */ ]] && [[ "$target" != "/" ]]; then
            new_target="${target%/}"  # Remove trailing slash
            rm "$f"
            ln -s "$new_target" "$f"
            echo "Fixed: $f -> $new_target"
        fi
    fi
done
