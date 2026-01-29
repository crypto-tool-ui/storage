FROM minio/minio:latest

# Set environment variables for MinIO credentials
ENV MINIO_ROOT_USER=minioadmin
ENV MINIO_ROOT_PASSWORD=minioadmin123

# Create a directory for MinIO data
RUN mkdir -p /data

# Expose ports
# 9000 for API
# 8000 for Console (web UI)
EXPOSE 9000 8000

# Create startup script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Start MinIO server
ENTRYPOINT ["/docker-entrypoint.sh"]
