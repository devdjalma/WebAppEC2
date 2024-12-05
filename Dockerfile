FROM python:3.8-slim-buster

# Configurar variáveis de ambiente sensíveis
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Copiar o arquivo para poder instalar depois
COPY requirements.txt requirements.txt

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y libpq-dev gcc

# Instalar Requirements
RUN pip3 install -r requirements.txt 

COPY . .

CMD ["./wait-for-it.sh", "db:5432", "--", "python", "manage.py", "runserver", "0.0.0.0:8000"]
