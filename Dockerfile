FROM restic/restic:latest

ADD entry.sh /
ADD backup.sh /
ADD check.sh /

ENV AWS_DEFAULT_REGION "eu-central-1"
ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""
ENV RESTIC_REPOSITORY ""
ENV RESTIC_PASSWORD ""

ENV BACKUP_CRON "00 */24 * * *"
ENV CHECK_CRON "00 04 * * 1"
ENV BACKUP_SOURCE "/data"
ENV RESTIC_FORGET_ARGS "--keep-last 7"
ENV NICE_ADJUST "10"
ENV IONICE_CLASS "2"
ENV IONICE_PRIO "7"

ENTRYPOINT ["/entry.sh"]

# CMD is run after entrypoint script finishes setup
CMD ["tail", "-fn0", "/var/log/cron.log"]
