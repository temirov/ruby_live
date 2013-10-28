kill -9 `pidof ruby`
RAILS_ENV=c9 rails s --debugger -b $IP -p $PORT