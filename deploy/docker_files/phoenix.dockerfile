FROM marcelocg/phoenix
ADD . /code
WORKDIR /code/lehelchatbot
RUN apt-get update && apt-get install -yq curl git build-essential erlang-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN git clone https://github.com/drdorianwhite/lehelchatbot.git .
WORKDIR ./priv/keys
RUN openssl genrsa -out localhost.key 2048
RUN openssl req -new -x509 -key localhost.key -out localhost.cert -days 3650 -subj /CN=localhost
WORKDIR /code/lehelchatbot
RUN mix deps.get
RUN npm install

