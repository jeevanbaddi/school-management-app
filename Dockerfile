# Base image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Copy dependency file first (layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose Flask port
EXPOSE 5000

# Start application
CMD ["python", "app/main.py"]
