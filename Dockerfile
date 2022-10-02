FROM --platform=linux/x86_64 fluent/fluentd:v1.15.2-debian-1.0

USER root

RUN apt-get update \
    && apt-get -y install netcat \
    && gem install fluent-plugin-elasticsearch --no-document --version 5.2.3 \
    && gem uninstall --ignore-dependencies faraday \
    && gem install faraday --no-document --version 1.10.0 \
    && gem sources --clear-all \
    && apt-get purge -y --auto-remove \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent