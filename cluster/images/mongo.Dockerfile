FROM mongo:4.2

RUN mkdir -p /keys
COPY ./secrets/mongo-keyfile /keys/mongo-keyfile
RUN chown mongodb:mongodb /keys/mongo-keyfile
RUN chmod 400 /keys/mongo-keyfile
