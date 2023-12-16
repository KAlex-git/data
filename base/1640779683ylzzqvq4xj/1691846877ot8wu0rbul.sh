#!/bin/sh

# переменные
# получаем рабочий каталог из параметра
DATADIR=$1
LOGFILE="$DATADIR/scripts/linux_sync.log"

# функции
log(){
  echo "$(date +""%d.%m.%Y\ %T"") === $@"
}

# перенаправляем вывод
exec 2>>$LOGFILE 1>>$LOGFILE

# вступление
echo ""
log "==============================================="
log "Changes from Linux"


# выполнение команд
log Command \"cd $DATADIR\"
cd $DATADIR

log Command \"git diff\"
git diff --name-status

log Command \"git add .\"
git add .

log Command \"git commit\"
curdate=$(date +"%d.%m.%Y %T")
git commit -a -v -m "Changes from Linux - $curdate"

log Command \"git pull\"
git pull -s recursive

log Command \"git push\"
git push
