sleep 20s
killall conky
cd "/home/adam/.conky"
conky -c "/home/adam/.conky/check_conky" &
cd "/home/adam/.conky"
conky -c "/home/adam/.conky/shortcuts_conky" &
cd "/home/adam/.conky"
conky -c "/home/adam/.conky/systemstats" &
cd "/home/adam/.conky"
conky -c "/home/adam/.conky/time" &
cd "/home/adam/.conky"
conky -c "/home/adam/.conky/weather" &
