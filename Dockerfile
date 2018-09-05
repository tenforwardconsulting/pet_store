FROM ruby:2.5.1-stretch
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs software-properties-common mupdf-tools

RUN mkdir /myapp
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
WORKDIR /myapp
COPY . /myapp
RUN bundle install
