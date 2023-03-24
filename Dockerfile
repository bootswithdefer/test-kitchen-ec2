FROM ruby:alpine
MAINTAINER Jesse DeFer <test-kitchen-ec2@dotd.com>

ENV PACKAGES build-base git openssh py-pip py3-cryptography py3-yaml py3-dateutil py3-jmespath py3-asn1 py3-colorama py3-rsa py3-fasteners
ENV GEMS serverspec etc test-kitchen kitchen-ec2 kitchen-docker kitchen-ansible kitchen-verifier-serverspec serverspec etc

RUN apk add --no-cache $PACKAGES
RUN adduser -D -u 1000 jenkins

RUN ssh-keyscan github.com > /etc/ssh/ssh_known_hosts

RUN pip install awscli python-gilt
RUN gem install $GEMS
