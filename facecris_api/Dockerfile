FROM python:3.11

# Define el directorio de trabajo en el contenedor
WORKDIR /app

# Copia requirements.txt en /app
COPY facecris_api/requirements.txt .

# Instala las dependencias
RUN pip install --upgrade pip && pip install -r requirements.txt

# Crea el directorio /app/facecris_api explícitamente y copia los archivos
#RUN mkdir -p /app/facecris_api
COPY . /app/

# Cambia el directorio de trabajo a /app/facecris_api
#WORKDIR /app/facecris_api

# Ejecuta el servidor usando Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "facecris_api.wsgi:application"]

