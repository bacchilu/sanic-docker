FROM python
LABEL maintainer="Luca Bacchi <bacchilu@gmail.com> (https://github.com/bacchilu)"

WORKDIR /app

ARG UID
ARG GID

RUN groupadd -g "${GID}" python
RUN useradd --create-home --no-log-init -u "${UID}" -g "${GID}" python
RUN chown python:python -R /app

USER python

COPY --chown=python:python requirements.txt .

RUN pip3 install -r requirements.txt

ENV PYTHONPATH="."
ENV PATH="${PATH}:/home/python/.local/bin"
ENV USER="python"

COPY --chown=python:python . .

EXPOSE 8000

CMD ["sanic", "server.app", "--host=0.0.0.0", "--fast"]