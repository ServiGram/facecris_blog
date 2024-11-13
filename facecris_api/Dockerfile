# Dockerfile para backend (Django)
FROM python:3.11

WORKDIR /app

COPY facecris_api/requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r /app/requirements.txt

COPY ./facecris_api /app/

CMD ["/bin/bash"]