# Intentionally misconfigured Dockerfile
FROM ubuntu:latest

# Running as root (should use non-root user)
RUN apt-get update && apt-get install -y curl wget

COPY app.py /app/app.py

# No HEALTHCHECK defined

EXPOSE 8080

CMD ["python3", "/app/app.py"]
