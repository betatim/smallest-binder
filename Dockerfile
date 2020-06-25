FROM alpine:3.12

RUN apk --no-cache add \
    python3 \
    py3-pip \
    py3-pyzmq

RUN python3 -mpip install --no-cache \
                           notebook \
                           "wasabi>=0.2.1,<1.1.0" \
                           "pytest>=4.4.1,<4.5.0" \
                           "black==19.10b0" \
                           "altair>=4.1.0" \
                           "xlrd>=1.0.0" \
                           "pandas==1.0.5" \
                           "plotly==4.8.1" \
                           "numpy>=1.11.0,<1.16.4" \
                           "matplotlib==3.*"

# create user with a home directory
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}
ENV PATH /home/${NB_USER}/.local/bin:${PATH}

RUN adduser -D \
    -g "Default user" \
    -u ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}
