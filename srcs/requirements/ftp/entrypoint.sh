#!/bin/sh

# set -e

# ANON_ROOT=${ANON_ROOT:-/var/ftp}
# MAX_PORT=${MAX_PORT:-65515}
# MIN_PORT=${MIN_PORT:-65500}
# MAX_PER_IP=${MAX_PER_IP:-2}
# MAX_LOGIN_FAILS=${MAX_LOGIN_FAILS:-2}
# MAX_CLIENTS=${MAX_CLIENTS:-50}
# MAX_RATE=${MAX_RATE:-6250000}
# FTPD_BANNER=${FTPD_BANNER:-"Welcome to an awesome public FTP Server"}


# [ -f /etc/vsftpd.conf ] || cat <<EOF > /etc/vsftpd.conf
# listen=YES
# anonymous_enable=YES
# dirmessage_enable=YES
# use_localtime=YES
# connect_from_port_20=YES
# secure_chroot_dir=/var/run/vsftpd/empty
# write_enable=NO
# seccomp_sandbox=NO
# xferlog_std_format=NO
# log_ftp_protocol=YES
# anon_root=${ANON_ROOT}
# pasv_max_port=${MAX_PORT}
# pasv_min_port=${MIN_PORT}
# max_per_ip=${MAX_PER_IP}
# max_login_fails=${MAX_LOGIN_FAILS}
# max_clients=${MAX_CLIENTS}
# anon_max_rate=${MAX_RATE}
# ftpd_banner=${FTPD_BANNER}
# EOF

/usr/sbin/vsftpd "/etc/vsftpd.conf" 2>/ftp.log