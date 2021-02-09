FROM mysql:5.7

ENV MYSQL_DATABASE codelog
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_USER user
ENV MYSQL_PASSWORD password
ENV TZ 'Asia/Tokyo'

# MySQL設定ファイルをイメージ内にコピー
ADD ./my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]