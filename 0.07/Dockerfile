FROM ruby:2.1

ENV NAME=dnscat2 \
    VERSION=0.07 \
    DOWNLOAD_URL=https://github.com/iagox86/dnscat2/archive/refs/tags/v0.07.tar.gz

RUN curl -sSL $DOWNLOAD_URL -o dnscat2.tar.gz && \
    tar xzf dnscat2.tar.gz && \
    cd $NAME-$VERSION/server && \
    bundle install && \
    cd /$NAME-$VERSION/client && \
    make && \
    ln -s /$NAME-$VERSION /dnscat2

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh

EXPOSE 53/udp

ENTRYPOINT ["/entry.sh"]