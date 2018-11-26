FROM ruby:alpine
MAINTAINER Jesse DeFer <test-kitchen-ec2@dotd.com>

ENV PACKAGES build-base git openssh python2-dev py2-pip
ENV GEMS serverspec etc test-kitchen kitchen-ec2 kitchen-docker kitchen-ansible kitchen-verifier-serverspec serverspec etc

RUN apk update && \
    apk upgrade && \
    apk add $PACKAGES && \
    rm -rf /var/cache/apk/* && \
    pip install awscli && \
    adduser -D -u 1000 jenkins && \
    mkdir -p /home/jenkins/.ssh && \
    chmod 0700 /home/jenkins/.ssh && \
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/jenkins/.ssh/config && \
    chmod 0600 /home/jenkins/.ssh/config && \
    chown -R jenkins:jenkins /home/jenkins/.ssh && \
    gem install --no-ri --no-rdoc $GEMS
