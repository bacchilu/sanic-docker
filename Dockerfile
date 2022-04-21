FROM python

ARG USER_ID
RUN useradd -ms /bin/bash USER_ID
USER USER_ID

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8000

CMD python3 server.py
