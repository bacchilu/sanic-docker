FROM python

COPY requirements.txt .

RUN pip3 install -r requirements.txt

ARG USER_ID=1000
RUN useradd -ms /bin/bash USER_ID
USER USER_ID

WORKDIR /app

COPY . .

EXPOSE 8000

CMD sanic server.app --host=0.0.0.0 --fast