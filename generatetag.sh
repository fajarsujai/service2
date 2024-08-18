#!/bin/bash

# Nama file values.yaml
VALUES_FILE="values.yaml"

# Nilai yang akan diubah
IMAGE_TAG=$1
# SERVICE_PORT="8080"
# CPU_REQUEST="500m"

# Periksa apakah file values.yaml ada
if [[ ! -f "$VALUES_FILE" ]]; then
  echo "File $VALUES_FILE tidak ditemukan!"
  exit 1
fi

# Mengubah nilai dengan yq
echo "Mengubah nilai di $VALUES_FILE..."

# Mengubah tag image
yq eval ".image.tag = \"$IMAGE_TAG\"" -i "$VALUES_FILE"

# # Mengubah port service
# yq eval ".service.port = $SERVICE_PORT" -i "$VALUES_FILE"

# # Mengubah request CPU resources
# yq eval ".resources.requests.cpu = \"$CPU_REQUEST\"" -i "$VALUES_FILE"

# echo "Perubahan berhasil diterapkan!"

# Tampilkan isi file setelah perubahan
echo "Isi file $VALUES_FILE setelah perubahan:"
cat "$VALUES_FILE"