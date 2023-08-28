#!/bin/sh

# macOS :
# syncs repo's files to default macOS folder locations for reason codecs
## NOT TESTED YET
echo 'COPYING...';

mkdir -p ~/Library/Application\ Support/Propellerhead\ Software/Remote/Codecs/Lua\ Codecs/Akai/
cp ./Remote/Codecs/Lua\ Codecs/Akai/*.* ~/Library/Application\ Support/Propellerhead\ Software/Remote/Codecs/Lua\ Codecs/Akai/;
echo 'Lua Codecs copied.';

mkdir -p ~/Library/Application\ Support/Propellerhead\ Software/Remote/Maps/Akai/
cp ./Remote/Maps/Akai/*.* ~/Library/Application\ Support/Propellerhead\ Software/Remote/Maps/Akai/;
echo 'Remote Maps copied.';

echo '⇨ COMPLETE';
