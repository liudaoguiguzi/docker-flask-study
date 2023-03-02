FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf
COPY a.html /usr/share/nginx/html
COPY app.py /app/app.py

RUN apt-get update && apt-get install -y python3-pip && \
    pip3 install flask

EXPOSE 80 

CMD ["/bin/bash", "-c", "python3 /app/app.py & nginx -g 'daemon off;'"]
