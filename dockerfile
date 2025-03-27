FROM python:3.11-slim
WORKDIR /app
COPY . .
pip install --upgrade -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
