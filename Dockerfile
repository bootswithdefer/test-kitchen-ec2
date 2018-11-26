FROM ruby:2.4-alpine
MAINTAINER Jesse DeFer <test-kitchen-ec2@dotd.com>

ENV PACKAGES build-base git openssh python2-dev py2-pip

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $PACKAGES && \
    rm -rf /var/cache/apk/* && \
    pip install awscli

RUN gem install --no-ri --no-rdoc serverspec etc test-kitchen kitchen-ec2 kitchen-docker kitchen-ansible kitchen-verifier-serverspec serverspec etc
