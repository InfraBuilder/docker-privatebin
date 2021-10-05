FROM php:7-apache

ENV PRIVATEBIN_VERSION=1.3.5

RUN apt-get update \
    && apt-get install -y \
        libgd-dev \
        libjpeg-dev \
        libpng-dev \
        libxslt-dev \
        libxml2-dev \
        libzip-dev \
        lsof \
        msmtp \
        unzip \
        sudo \
        zip \
    && docker-php-ext-install \
        gd \
        intl \
        opcache \
        pdo_mysql \
        zip \
    && a2enmod \
        headers \
        rewrite \
        remoteip \
    && apt-get clean \
    && rm -rf /var/cache/apt \
    && curl -LO https://github.com/PrivateBin/PrivateBin/archive/${PRIVATEBIN_VERSION}.tar.gz \
    && tar -xf ${PRIVATEBIN_VERSION}.tar.gz --strip 1 \
    && rm ${PRIVATEBIN_VERSION}.tar.gz \
    && mkdir /data && chown www-data:www-data /data \
    && chown root:root /var/www/html
    
COPY files/ /

ENV CONFIG_PATH=/config \
    PRIVATEBIN_NAME=PrivateBin \
    PRIVATEBIN_DISCUSSION_ENABLE=true \
    PRIVATEBIN_DISCUSSION_DEFAULT=false \
    PRIVATEBIN_PASSWORD_ENABLE=true \
    PRIVATEBIN_FILEUPLOAD_ENABLE=false \
    PRIVATEBIN_BURNAFTERREADING_DEFAULT=false \
    PRIVATEBIN_FORMATTER_DEFAULT=plaintext \
    PRIVATEBIN_SYNTAX_HIGHLIGHT_THEME="" \
    PRIVATEBIN_SIZE_LIMIT=10485760 \
    PRIVATEBIN_TEMPLATE=bootstrap \
    PRIVATEBIN_NOTICE="Note: This is a test service: Data may be deleted anytime. Kittens will die if you abuse this service." \
    PRIVATEBIN_LANGUAGE_SELECTION=true \
    PRIVATEBIN_LANGUAGE_DEFAULT=en \
    PRIVATEBIN_URLSHORTENER_URL="" \
    PRIVATEBIN_QRCODE=true \
    PRIVATEBIN_ICON=identicon \
    PRIVATEBIN_ZEROBINCOMPATIBILITY=false \
    PRIVATEBIN_HTTP_WARNING=true \
    PRIVATEBIN_COMPRESSION=zlib \
    PRIVATEBIN_RATE_LIMIT=10 \
    PRIVATEBIN_REAL_IP_HEADER="X_FORWARDED_FOR" \
    PRIVATEBIN_STORAGE="filesystem" \
    PRIVATEBIN_DATA_PATH="/data" \
    PRIVATEBIN_MYSQL_HOST="mysql" \
    PRIVATEBIN_MYSQL_DATABASE="privatebin" \
    PRIVATEBIN_MYSQL_TABLE_PREFIX="pb_" \
    PRIVATEBIN_MYSQL_USERNAME="privatebin" \
    PRIVATEBIN_MYSQL_PASSWORD="Y0uMustChang3M3" \
    PRIVATEBIN_MYSQL_ATTR_PERSISTENT=true \
    PRIVATEBIN_SQLITE_DB_PATH="/data/db.sq3" \
    PRIVATEBIN_SQLITE_ATTR_PERSISTENT=true

ENTRYPOINT ["/entrypoint.sh"]

CMD ["apache2-foreground"]
