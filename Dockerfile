# our base image
FROM container4armhf/armhf-alpine

#VOLUME /data

# Install yaml from apt, to also install the cpp lib
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache

# Install home assistant
RUN pip3 install homeassistant==0.44.0

#WORKDIR /data

EXPOSE 8123

# Define default command
CMD ["hass"]

