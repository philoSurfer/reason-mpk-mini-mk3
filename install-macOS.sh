#!/bin/sh

# macOS :
# syncs repo's files to default macOS folder locations for reason codecs
## NOT TESTED YET
echo '\n';
echo '---COPYING--------------------------+++- ';
echo '\n';

cp ./Remote/Codecs/Lua\ Codecs/Akai/*.* ~/Library/Application\ Support/Propellerhead\ Software/Remote/Codecs/Lua\ Codecs/Akai/;
echo 'Lua Codecs copied.';
echo '\n';

cp ./Remote/Maps/Akai/*.* ~/Library/Application\ Support/Propellerhead\ Software/Remote/Maps/Akai/;
echo 'Remote Maps copied.';
echo '\n';

echo '---COMPLETE-------------------------XXX-';
