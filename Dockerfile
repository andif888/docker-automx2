FROM python:3.11.1-alpine
LABEL maintainer="andif888"

# upgrade pip
RUN pip install --upgrade pip

# get curl for healthchecks
RUN apk add bash curl build-base gcc

# permissions and nonroot user for tightened security
RUN adduser -D nonroot
RUN mkdir -p /srv/web/automx2 && chown -R nonroot:nonroot /srv/web/automx2
WORKDIR /srv/web/automx2
USER nonroot

# copy all the files to the container
COPY --chown=nonroot:nonroot ./scripts/. /srv/web/automx2/.

# venv
ENV VIRTUAL_ENV=/srv/web/automx2/venv

# python setup
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install automx2

# define the port number the container should expose
EXPOSE 4243

ENTRYPOINT [ "/srv/web/automx2/entrypoint.sh" ]
