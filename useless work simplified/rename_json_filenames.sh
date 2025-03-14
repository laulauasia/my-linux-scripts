#!/bin/bash

# Set the root directory
ROOT_DIR="/Users/laulau/Library/CloudStorage/GoogleDrive-ch.lau@adversos.agency/My Drive/Templates/Free-Stuff/Elementor Templates"

# Loop through all directories and subdirectories
find "$ROOT_DIR" -depth -type d | while read -r dir; do
  # Loop through all JSON files in the current directory
  find "$dir" -maxdepth 1 -name "*.json" -print0 | while IFS= read -r -d $'\0' file; do
    filename=$(basename "$file")
    dirname=$(dirname "$file")

    # Translation and Renaming logic (add more cases as needed)
    if [[ "$filename" == "4 Captura por interesse.json" ]]; then
      new_filename="4 Capture by interest.json"
    elif [[ "$filename" == "Ebook pagina pequena.json" ]]; then
      new_filename="Ebook small page.json"
    else
      # If no translation is defined, keep the original filename (or handle differently)
      new_filename="$filename"
    fi

    if [[ "$filename" != "$new_filename" ]]; then
      echo "Renaming '$filename' to '$new_filename' in '$dirname'"
      mv "$file" "$dirname/$new_filename"
    fi
  done
done

echo "JSON filename renaming script completed."
