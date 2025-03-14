#!/bin/bash

# Set the root directory
ROOT_DIR="/Users/laulau/Library/CloudStorage/GoogleDrive-ch.lau@adversos.agency/My Drive/Templates/Free-Stuff/Elementor Templates"

echo "Renaming directories with Spanish names..."

# Rename directories
find "$ROOT_DIR" -depth -type d -print0 | while IFS= read -r -d $'\0' dir; do
  if [[ "$dir" == *"/50 Moldelos de Pagina de Vendas prontas"* ]]; then
    mv "$dir" "$(dirname "$dir")/50 Landing Page Models Ready"
    echo "Renamed '50 Moldelos de Pagina de Vendas prontas' to '50 Landing Page Models Ready'"
  elif [[ "$dir" == *"/Páginas De Vendas PLR Brasil 2022"* ]]; then
    mv "$dir" "$(dirname "$dir")/Sales Pages PLR Brazil 2022"
    echo "Renamed 'Páginas De Vendas PLR Brasil 2022' to 'Sales Pages PLR Brazil 2022'"
  elif [[ "$dir" == *"/10 LP profissionais atualizadas 2022"* ]]; then
    mv "$dir" "$(dirname "$dir")/10 Professional LP Updated 2022"
    echo "Renamed '10 LP profissionais atualizadas 2022' to '10 Professional LP Updated 2022'"
  elif [[ "$dir" == *"/LP CURSO DE FUNCIONAL - 08"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP FUNCTIONAL COURSE - 08"
    echo "Renamed 'LP CURSO DE FUNCIONAL - 08' to 'LP FUNCTIONAL COURSE - 08'"
  elif [[ "$dir" == *"/LP PLR DE RECEITAS - 10"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP PLR RECIPES - 10"
    echo "Renamed 'LP PLR DE RECEITAS - 10' to 'LP PLR RECIPES - 10'"
  elif [[ "$dir" == *"/LP OVOS DE PÁSCOA - 04"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP EASTER EGGS - 04"
    echo "Renamed 'LP OVOS DE PÁSCOA - 04' to 'LP EASTER EGGS - 04'"
  elif [[ "$dir" == *"/LP ENCAPSULADO - 01"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP ENCAPSULATED - 01"
    echo "Renamed 'LP ENCAPSULADO - 01' to 'LP ENCAPSULATED - 01'"
  elif [[ "$dir" == *"/LP ACADEMIA FITNESS - 06"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP FITNESS ACADEMY - 06"
    echo "Renamed 'LP ACADEMIA FITNESS - 06' to 'LP FITNESS ACADEMY - 06'"
  elif [[ "$dir" == *"/LP ESTÚDIO DE TATUAGEM - 03"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP TATTOO STUDIO - 03"
    echo "Renamed 'LP ESTÚDIO DE TATUAGEM - 03' to 'LP TATTOO STUDIO - 03'"
  elif [[ "$dir" == *"/LP CONCURSO PUBLICO - 02"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP PUBLIC COMPETITION - 02"
    echo "Renamed 'LP CONCURSO PUBLICO - 02' to 'LP PUBLIC COMPETITION - 02'"
  elif [[ "$dir" == *"/LP CURSO DE PAPINHA - 05"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP BABY FOOD COURSE - 05"
    echo "Renamed 'LP CURSO DE PAPINHA - 05' to 'LP BABY FOOD COURSE - 05'"
  elif [[ "$dir" == *"/LP CURSO DE EDICAO PHOTOSHOP - 07"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP PHOTOSHOP EDITING COURSE - 07"
    echo "Renamed 'LP CURSO DE EDICAO PHOTOSHOP - 07' to 'LP PHOTOSHOP EDITING COURSE - 07'"
  elif [[ "$dir" == *"/LP CURSO DE MENTALIDADE - 09"* ]]; then
    mv "$dir" "$(dirname "$dir")/LP MINDSET COURSE - 09"
    echo "Renamed 'LP CURSO DE MENTALIDADE - 09' to 'LP MINDSET COURSE - 09'"
  elif [[ "$dir" == *"/Pagina de Vendas - Editável"* ]]; then
    mv "$dir" "$(dirname "$dir")/Sales Page - Editable"
    echo "Renamed 'Pagina de Vendas - Editável' to 'Sales Page - Editable'"
  fi
done

echo "Directory renaming completed."

echo "Renaming files with Spanish names..."

# Rename files
find "$ROOT_DIR" -depth -type f -print0 | while IFS= read -r -d $'\0' file; do
  filename=$(basename "$file")
  new_filename="$filename"

  # Basic Spanish to English character replacement
  new_filename="${new_filename//á/a}"
  new_filename="${new_filename//é/e}"
  new_filename="${new_filename//í/i}"
  new_filename="${new_filename//ó/o}"
  new_filename="${new_filename//ú/u}"
  new_filename="${new_filename//ñ/n}"
  new_filename="${new_filename//ç/c}"

  # Basic Spanish word replacement - more can be added
  new_filename="${new_filename//pagina/page}"
  new_filename="${new_filename//pequena/small}"
  new_filename="${new_filename//interesse/interest}"
  new_filename="${new_filename//gratuito/free}"
  new_filename="${new_filename//aula/class}"
  new_filename="${new_filename//ao vivo/live}"
  new_filename="${new_filename//video/video}"
  new_filename="${new_filename//empreendedor/entrepreneur}"
  new_filename="${new_filename//nicho/niche}"
  new_filename="${new_filename//negro/black}"
  new_filename="${new_filename//muestra/sample}"
  new_filename="${new_filename//modelo/model}"


  if [[ "$filename" != "$new_filename" ]]; then
    new_file_path="$(dirname "$file")/$new_filename"
    mv "$file" "$new_file_path"
    echo "Renamed '$filename' to '$new_filename'"
  fi
done

echo "File renaming completed."
