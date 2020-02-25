From tensorflow/tensorflow:2.0.1-gpu

RUN apt-get update
RUN apt-get install -y libpq-dev python-dev

RUN groupadd -g 799 tf && \
    useradd -r -u 999 -g tf tf

WORKDIR /app


COPY requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt


COPY . /app
RUN ./setup.sh

RUN mkdir -p /home/tf
RUN ./create_ssl_certificate.sh

RUN chown tf:tf /home/tf
RUN chown tf:tf /home/tf/cert.pem
RUN chown tf:tf /home/tf/key.pem


RUN mkdir -p /app/tf
RUN chown tf:tf /app/tf

USER tf

CMD ["/bin/bash", "run.py"]
