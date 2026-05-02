FROM python:3.12-slim

WORKDIR /app

RUN pip install --no-cache-dir django gunicorn

RUN django-admin startproject app .

EXPOSE 8000

CMD ["gunicorn", "app.wsgi:application", "--bind", "0.0.0.0:8000"]
