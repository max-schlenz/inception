FROM		alpine:3.16.4
ENTRYPOINT	["/bin/sh"]

EXPOSE		80 433

RUN			apk update && \
			apk upgrade && \
			apk add nginx


# CMD			["nginx", "-g", "daemon off;"]