# Use slim variant for a smaller image size
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Ensure Poetry is in PATH
ENV PATH="/root/.local/bin:$PATH"

# Copy only the lockfile and pyproject.toml first (for better layer caching)
COPY pyproject.toml poetry.lock ./

# Install dependencies using Poetry (without creating a virtualenv)
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-root

# Copy the rest of the application code
COPY . .

# Set the default command (adjust as needed)
CMD ["python", "main.py"]