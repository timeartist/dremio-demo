FROM python:3.12

RUN curl -sSL https://install.python-poetry.org |  POETRY_HOME=/usr/local python3 -

WORKDIR /opt/dremio-demo

COPY pyproject.toml .

RUN poetry install 

# Development workaround - make sure we don't override poetry.lock inside the container with one we're copying from local
RUN mv poetry.lock poetry.lock.bak
COPY . .
RUN mv poetry.lock.bak poetry.lock