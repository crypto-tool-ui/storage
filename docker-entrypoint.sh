#!/bin/sh

# Start MinIO server in background
minio server /data --console-address ":8000" --address ":9000" &

# Wait for MinIO to be ready
sleep 5

# Configure MinIO client (mc)
mc alias set myminio http://localhost:9000 ${MINIO_ROOT_USER} ${MINIO_ROOT_PASSWORD}

# Create a public bucket
mc mb myminio/public-bucket --ignore-existing

# Set bucket policy to public (download only)
mc anonymous set download myminio/public-bucket

# Optional: Set bucket policy to public (upload and download)
# mc anonymous set public myminio/public-bucket

echo "MinIO is ready!"
echo "Access MinIO Console at: http://localhost:8000"
echo "MinIO API endpoint: http://localhost:9000"
echo "Public bucket created: public-bucket"
echo "Username: ${MINIO_ROOT_USER}"
echo "Password: ${MINIO_ROOT_PASSWORD}"

# Keep container running
wait
