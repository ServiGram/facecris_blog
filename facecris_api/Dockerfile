# Dockerfile para backend (Django)
FROM python:3.11

WORKDIR /app

COPY facecris_api/ /app/

RUN pip install --upgrade pip && pip install -r /app/requirements.txt

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "facecris_api.wsgi:application"]