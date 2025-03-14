#!/bin/bash

# Set the root directory
ROOT_DIR="/Users/laulau/Library/CloudStorage/GoogleDrive-ch.lau@adversos.agency/My Drive/Templates/Free-Stuff/Elementor Templates"

# Array of Spanish characters and word fragments to look for
spanish_chars=("á" "é" "í" "ó" "ú" "ñ" "ç" "pagina" "pequena" "interesse" "por" "captura" "gratuito" "aula" "ao" "vivo" "video" "empreendedor" "nicho" "negro")

echo "Scanning directory '$ROOT_DIR' for Spanish filenames and folder names..."

# Loop through all directories and subdirectories
find "$ROOT_DIR" -depth -print | while read -r name; do
  is_spanish=false
  for char in "${spanish_chars[@]}"; do
    if [[ "$name" == *"$char"* ]]; then
      is_spanish=true
      break
    fi
  done

  if $is_spanish; then
    echo "$name"
  fi
done

echo "Scan completed."
