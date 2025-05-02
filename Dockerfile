# Use the official Python image from Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements file first
COPY requirements.txt /app/

# Install the dependencies
RUN pip install --no-cache-dir -i https://pypi.org/simple --timeout=120 -r requirements.txt

# Copy the remaining application code
COPY . /app/

# Expose the port the app runs on
EXPOSE 8501

# Run the app only on localhost
CMD ["streamlit", "run", "app.py"]
