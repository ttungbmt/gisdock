### Chạy tự động bash khi startup
ADD start.sh /etc/my_init.d

### Chạy từ 1 file bash
ADD start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh && dos2unix /usr/local/bin/start.sh

ENTRYPOINT ["bash", "/usr/local/bin/start.sh"]


* * * * * cd /var/www/laragis && php artisan schedule:run >> /dev/null 2>&1