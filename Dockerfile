FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app
RUN pip install --no-cache-dir poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi
RUN poetry install -E server --no-interaction --no-ansi
EXPOSE 8000
CMD ["uvicorn", "examples.chain.server:app", "--host", "0.0.0.0", "--port", "8000"]