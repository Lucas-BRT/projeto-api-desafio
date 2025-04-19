# Imagem base do Python
FROM python:3.11-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos para o container
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expõe a porta padrão do Flask
EXPOSE 5000

# Comando para rodar a aplicação usando Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
