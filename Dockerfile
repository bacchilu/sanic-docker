FROM python
LABEL maintainer="Luca Bacchi <bacchilu@gmail.com> (https://github.com/bacchilu)"

WORKDIR /app

ARG UID=1000
ARG GID=1000
ARG USERNAME=bacchilu

RUN groupadd -g "${GID}" ${USERNAME}
RUN useradd --create-home --no-log-init -u "${UID}" -g "${GID}" ${USERNAME}
RUN chown ${USERNAME}:${USERNAME} -R /app

USER ${USERNAME}

COPY --chown=${USERNAME}:${USERNAME} requirements.txt .

RUN pip3 install -r requirements.txt

ENV PATH="${PATH}:/home/${USERNAME}/.local/bin"

COPY --chown=${USERNAME}:${USERNAME} . .

EXPOSE 8000

CMD sanic server.app --host=0.0.0.0 --fast