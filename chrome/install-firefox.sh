# https://gist.github.com/eddiejaoude/0076739fe610189581d0

# linux
# wget \
#   https://addons.mozilla.org/firefox/downloads/latest/1865/addon-1865-latest.xpi \
#   https://addons.mozilla.org/firefox/downloads/latest/433/addon-433-latest.xpi \
#   https://addons.mozilla.org/firefox/downloads/latest/3006/addon-3006-latest.xpi &&
#   firefox *.xpi && rm *.xpi

# wget \
#   https://addons.mozilla.org/firefox/downloads/latest/3006/addon-3006-latest.xpi &&
#   firefox *.xpi && rm *.xpi

# mac
wget -O ublock_origin-1.37.2-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3816867/ublock_origin-1.37.2-an+fx.xpi &&
  wget -O tabliss_new_tab-2.1.0-fx.xpi https://addons.mozilla.org/firefox/downloads/file/3716637/tabliss_new_tab-2.1.0-fx.xpi &&
  wget -O adblocker_ultimate-3.7.11-an+fx.xpi https://addons.mozilla.org/firefox/downloads/file/3814547/adblocker_ultimate-3.7.11-an+fx.xpi &&
  Applications/Firefox.app/Contents/MacOS/firefox *.xpi && rm *.xpi
