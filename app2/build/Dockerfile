 #Use the official PHP image as the base image
FROM php:8.1-fpm

# Set the working directory in the container
WORKDIR /var/www/html

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql

# Copy the local Laravel project files to the container
COPY ./src/ .
COPY ./src/.env .
# Install Composer and Laravel dependencies
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install 

# Expose port 8000 to communicate with the web server
EXPOSE 8000

# Start PHP-FPM
# CMD ["php-fpm"]
CMD php artisan serve --host=0.0.0.0 --port=8000
