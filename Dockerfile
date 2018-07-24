FROM evns/grav

WORKDIR /var/www/grav-admin

RUN chmod +x bin/gpm && \
    ./bin/gpm selfupgrade -y & \
    ./bin/gpm update -y

COPY admin.yaml user/accounts/

COPY system.yaml user/config/

RUN chown -R www-data:www-data .