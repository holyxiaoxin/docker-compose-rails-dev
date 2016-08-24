FROM ruby:2.3.1
RUN set -x \
    && apt-get update \
    && apt-get install -y nodejs \
    && curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/local/bin/wait-for-it \
    && chmod +x /usr/local/bin/wait-for-it
WORKDIR /myapp
ADD Gemfile Gemfile.lock /myapp/
RUN bundle install
ADD . /myapp
ENTRYPOINT /myapp/docker-entrypoint.sh
