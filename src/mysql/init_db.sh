mysql_install_db --user=root --ldata=/var/lib/mysql
cat > /tmp/sql << eof
CREATE DATABASE wordpress;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
FLUSH PRIVILEGES;
eof
# Add Database
if [ ! -f /var/lib/mysql/wordpress ]; then
	mysql -h localhost wordpress < ./wordpress.sql
fi
telegraf &
/usr/bin/mysqld --console --init_file=/tmp/sql