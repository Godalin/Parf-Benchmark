#define LINUX 1
#define DEBUG 0
#define FEAT_CMDMON 1
#define FEAT_NTP 1
#define FEAT_REFCLOCK 1
#define HAVE_LONG_TIME_T 1
#define NTP_ERA_SPLIT (1640995200LL - 0 * 24 * 3600)
#define HAVE_CLOCK_GETTIME 1
#define DEFAULT_CONF_FILE "/etc/chrony.conf"
#define DEFAULT_HWCLOCK_FILE ""
#define DEFAULT_PID_FILE "/var/run/chrony/chronyd.pid"
#define DEFAULT_RTC_DEVICE "/dev/rtc"
#define DEFAULT_USER "root"
#define DEFAULT_COMMAND_SOCKET "/var/run/chrony/chronyd.sock"
#define MAIL_PROGRAM "/usr/lib/sendmail"
#define CHRONYC_FEATURES "-READLINE -SECHASH -IPV6 -DEBUG"
#define CHRONYD_FEATURES "+CMDMON +NTP +REFCLOCK -RTC -PRIVDROP -SCFILTER -SIGND -ASYNCDNS -SECHASH -IPV6 -DEBUG"
#define CHRONY_VERSION "DEVELOPMENT"
