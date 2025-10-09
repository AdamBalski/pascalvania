FROM debian:12
ARG USERNAME=devuser

# Install packages
RUN apt-get update && apt-get install -y \
    apache2 \
    apache2-utils \
    libapache2-mod-php \
    php8.2 \
    php8.2-curl \
    php8.2-dba \
    php8.2-ldap \
    php8.2-mongodb \
    php8.2-mysql \
    php8.2-odbc \
    php8.2-snmp \
    php8.2-xsl \
    perl \
    libapache2-mod-perl2 \
    libapache2-mod-wsgi-py3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable apache2 modules
RUN a2enmod cgi userdir rewrite php8.2 wsgi

# Add the user
RUN useradd -m -s /bin/bash $USERNAME
RUN rm -rf /home/$USERNAME

# Configs, port and volume
COPY apache2-conf/ /etc/apache2/
EXPOSE 80
VOLUME ["/home/$USERNAME"]

# Run Apache in foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
