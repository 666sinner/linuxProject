sshpass -p "root" scp cat/s21_cat cicd2@192.168.0.22:/usr/local/bin/
sshpass -p "root" scp grep/s21_grep cicd2@192.168.0.22:/usr/local/bin/
sshpass -p "root" ssh cicd2@192.168.0.22 ls /usr/local/bin/ >> log.txt