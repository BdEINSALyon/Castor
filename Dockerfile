FROM ruby:2.3

RUN apt-get update -y && apt-get dist-upgrade -y && apt-get autoremove --purge -y && apt-get autoclean -y
RUN apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV RAILS_ENV="production"
ENV OPENING="Tue May 29 00:01:00 GMT+2 2018"
ENV CLOSING="Mon Jun 4 23:59:00 GMT+2 2018"
ENV SECRET_KEY="qdqs1432c1q354df3s54fq3s5df46q8z4s3f5ds4f35q4d435qvd6f43gv4wdf34gvdwf43g67qer684gv65w4cf34vfw"
ENV SECRET_KEY_BASE="qdqs1432c1q354df3s54fq3s5df46q8z4s3f5ds4f35q4d435qvd6f43gv4wdf34gvdwf43g67qer684gv65w4cf34vfw"
ENV MAILGUN_API=""
ENV MAILGUN_DOMAIN="elections.bde-insa-lyon.fr"
ENV DATABASE_URL=postgres://postgres@db/postgres
ENV DOMAIN="elections.bde-insa-lyon.fr"

CMD bash -c "bundle exec rake assets:precompile && bundle exec rake db:migrate && bundle exec rails s -p 3000 -b '0.0.0.0'"
