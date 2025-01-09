FROM nginx:latest
RUN apt-get update && \
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN chmod u-s /usr/bin/umount && \
    chmod g-s /usr/bin/expiry && \
    chmod u-s /usr/bin/chsh && \
    chmod u-s /usr/bin/passwd && \
    chmod u-s /usr/bin/mount && \
    chmod u-s /usr/bin/gpasswd && \
    chmod g-s /usr/bin/chage && \
    chmod u-s /usr/bin/su && \
    chmod g-s /usr/sbin/unix_chkpwd && \
    chmod u-s /usr/bin/newgrp && \
    chmod u-s /usr/bin/chfn
COPY hello.c /etc
COPY nginx.conf /etc/nginx
RUN gcc -o /etc/hello /etc/hello.c -lfcgi
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
USER appuser
CMD spawn-fcgi -p 8080 /etc/hello && nginx -g "daemon off;" && nginx -s reload
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1