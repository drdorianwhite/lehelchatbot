FROM marcelocg/phoenix
ADD . /code
WORKDIR /code
RUN apt-get update && apt-get install -yq curl git
RUN curl -sL https://deb.nodesource.com/setup | sudo bash - && \
apt-get install -yq nodejs build-essential
RUN npm install -g npm
RUN git clone https://github.com/drdorianwhite/lehelchatbot.git
RUN openssl genrsa -out localhost.key 2048
RUN openssl req -new -x509 -key localhost.key -out localhost.cert -days 3650 -subj /CN=localhost
COPY ./localhost.* ./priv/keys/
RUN npm install
RUN mix deps.get
RUN mix phoenix.server

