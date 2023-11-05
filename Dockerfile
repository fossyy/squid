FROM alpine

RUN apk add squid apache2-utils wget

ENV AUTH_PARAM_BASIC_PROGRAM /usr/lib/squid/basic_ncsa_auth /etc/squid/passwd
ENV AUTH_PARAM_BASIC_CHILDREN 5
ENV AUTH_PARAM_BASIC_REALM "Squid Basic Authentication"
ENV AUTH_PARAM_BASIC_CREDENTIALSTTL 2 hours

RUN rm /etc/squid/squid.conf && wget -P /etc/squid https://raw.githubusercontent.com/fossyy/squid/main/squid.conf && \
    echo "auth_param basic program ${AUTH_PARAM_BASIC_PROGRAM}" >> /etc/squid/squid.conf && \
    echo "auth_param basic children ${AUTH_PARAM_BASIC_CHILDREN}" >> /etc/squid/squid.conf && \
    echo "auth_param basic realm ${AUTH_PARAM_BASIC_REALM}" >> /etc/squid/squid.conf && \
    echo "auth_param basic credentialsttl ${AUTH_PARAM_BASIC_CREDENTIALSTTL}" >> /etc/squid/squid.conf && \
    echo "acl auth_users proxy_auth REQUIRED" >> /etc/squid/squid.conf && \
    echo "http_access allow auth_users" >> /etc/squid/squid.conf

EXPOSE 3128

CMD ["squid", "-N"]
