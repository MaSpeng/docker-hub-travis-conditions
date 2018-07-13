FROM ruby:2.5-alpine3.7

ENV TRAVIS_CONDITIONS_CLI_VERSION 1.0

RUN gem install travis-conditions --version "${TRAVIS_CONDITIONS_CLI_VERSION}"

ENTRYPOINT ["travis-conditions"]

CMD ["--help"]
