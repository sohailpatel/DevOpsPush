
backup_dir="/home/webonise/Desktop/backing"

user="root"
password="system"

mkdir -p "${backup_dir}"
chmod 777 "${backup_dir}"

mysql_databases=`echo 'show databases' | mysql --user=${user} --password=${password} `

for database in $mysql_databases
do
  echo "Creating backup of \"${database}\" database"
  mysqldump  --user=${user} --password=${password} ${database} | gzip > "${backup_dir}${database}.gz"
done
