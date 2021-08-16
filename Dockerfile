FROM whyour/qinglong:latest

ARG QL_VERSION

LABEL maintainer="gcdd1993 <gcwm99@gmail.com>"
LABEL qinglong_version="${QL_VERSION}"

RUN set -ex \
    && git clone https://github.com/MoonBegonia/ninja.git /ql/ninja \
    && cd /ql/ninja/backend \
    && pnpm install

COPY docker-entrypoint.sh /ql/docker/docker-entrypoint.sh
COPY sendNotify.js /ql/scripts/sendNotify.js

# fix "permission denied: unknown"
RUN set -ex \
    && chmod +x /ql/docker/docker-entrypoint.sh

EXPOSE 5701

ENTRYPOINT ["./docker/docker-entrypoint.sh"]