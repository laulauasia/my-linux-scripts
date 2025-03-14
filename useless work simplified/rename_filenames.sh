#!/bin/bash

# Set the root directory
ROOT_DIR="/Users/laulau/Library/CloudStorage/GoogleDrive-ch.lau@adversos.agency/My Drive/Templates/Free-Stuff/Elementor Templates"

# Translation map (extend this as needed)
declare -A translations
translations["pagina"]=page
translations["pequena"]=small
translations["interesse"]=interest
translations["por"]=by
translations["captura"]=capture
translations["gratuito"]=free
translations["aula"]=class
translations["ao"]=to
translations["vivo"]=live
translations["video"]=video
translations["empreendedor"]=entrepreneur
translations["nicho"]=niche
translations["negro"]=black


# Loop through all directories and subdirectories
find "$ROOT_DIR" -depth -type d | while read -r dir; do
  # Loop through all files in the current directory
  find "$dir" -maxdepth 1 -print0 | while IFS= read -r -d $'\0' file; do
    if [[ -f "$file" ]]; then # Only process files, skip directories
      filename=$(basename "$file")
      dirname=$(dirname "$file")
      new_filename="$filename"

      # Apply translations
      for spanish_word in "${!translations[@]}"; do
        english_word="${translations[$spanish_word]}"
        new_filename="${new_filename//$spanish_word/$english_word}"
      done

      # Basic cleanup - remove extra spaces, convert to lowercase (optional)
      new_filename=$(echo "$new_filename" | sed 's/  */ /g' | tr '[:upper:]' '[:lower:]')


      if [[ "$filename" != "$new_filename" ]]; then
        echo "Renaming '$filename' to '$new_filename' in '$dirname'"
        mv "$file" "$dirname/$new_filename"
      fi
    fi
  done
done

echo "Filename renaming script completed."
