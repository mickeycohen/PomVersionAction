FROM ubuntu:focal-20220801

RUN apt-get update -y && apt-get install libxml2-utils -y

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
