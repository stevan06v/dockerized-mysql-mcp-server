FROM python:latest

ENV MYSQL_HOST=localhost
ENV MYSQL_PORT=3306
ENV MYSQL_USER=your_username
ENV MYSQL_PASSWORD=your_password
ENV MYSQL_DATABASE=your_database

WORKDIR /app

COPY mysql_mcp_server /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD ["python", "-m", "mysql_mcp_server"]
