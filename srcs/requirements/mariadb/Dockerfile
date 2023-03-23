FROM		alpine:3.16.4
ENTRYPOINT	[ "/bin/zsh" ]

EXPOSE		80, 433

RUN			apk update && \
			apk upgrade && \
			apk add nginx zsh

RUN			chsh -s /bin/zsh


