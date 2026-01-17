FROM python:3.9-slim

WORKDIR /app

# Copy dependency file
COPY app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/extraction.py .

ENV PYTHONUNBUFFERED=1

CMD ["python", "extraction.py"]
