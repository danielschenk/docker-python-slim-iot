ARG PYTHONVERSION
ARG PYTHONVERSION=3.13
FROM python:${PYTHONVERSION} AS compile-image

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    cargo \
    pkg-config

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -U --no-cache-dir pip \
    && pip install --no-cache-dir -r requirements.txt

FROM python:${PYTHONVERSION}-slim

COPY --from=compile-image /opt/venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"
