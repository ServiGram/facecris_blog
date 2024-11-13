# Dockerfile para backend (Django)
FROM python:3.11

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --upgrade pip && pip install -r /app/requirements.txt

COPY . /app/facecris_api/

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "facecris_api/facecris_api.wsgi:application"]