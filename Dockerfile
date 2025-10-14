FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH="/root/.local/bin:${PATH}"

WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
COPY 1.txt ./
COPY 2.txt ./
COPY 3/ ./3/
COPY AGENTS.md ./
COPY CLAUDE.md ./
COPY README.md ./
COPY agency.py ./
COPY example_agent/ ./example_agent/
COPY example_agent2/ ./example_agent2/
COPY main.py ./
COPY pyproject.toml ./
COPY shared_instructions.md ./

CMD python -u main.py