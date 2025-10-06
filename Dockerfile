# Use Python base image
FROM python:3.11-slim

# Install system dependencies (for pdf/image processing)
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Run the chatbot
CMD ["python", "Chat_Qdrantveg.py"]
