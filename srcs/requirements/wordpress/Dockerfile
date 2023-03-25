FROM		alpine:3.17.2

RUN			apk update && \
			apk upgrade && \
			apk add zsh nano curl php-fpm
			# php7 php7-fpm php7-opcache

RUN			adduser -D -g '' -G www-data www-data
# CMD			["tail", "-f", "/dev/null"]
CMD			["/bin/zsh"]