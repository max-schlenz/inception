FROM		alpine:3.16.4
# ENTRYPOINT	["/bin/sh"]


RUN			apk update && \
			apk upgrade && \
			apk add bash nginx

EXPOSE		80
EXPOSE		443
# CMD			["/bin/bash"]

# CMD			["tail", "-f", "/dev/null"]
CMD			["nginx", "-g", "daemon off;"]