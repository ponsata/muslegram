# MySQL 5.7
FROM mysql:5.7

# 初期セットアップで利用するmy.cnfをイメージへコピー
# アーカイブを展開する必要などが無ければADDで無くてCOPYで良い。
COPY mysql_data /var/lib/mysql

#COPY my.cnf /etc/mysql/conf.d/my.cnf

# 初期セットアップで実行したいスクリプトをイメージへコピー
#COPY mysql_init /docker-entrypoint-initdb.d

ADD mysql_data /var/lib/backup/mysql 

CMD ["mysqld"]