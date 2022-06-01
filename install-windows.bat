@echo off

# windows :
# syncs repo's files to default windows folder locations for reason codecs
echo "---COPYING--------------------------+++-"

copy "Remote\Codecs\Lua Codecs\Akai\*.*" "%ProgramData%\Propellerhead Software\Remote\Codecs\Lua Codecs\Akai\"
echo "Lua Codecs copied."

copy "Remote\Maps\Akai\*.*" "%ProgramData%\Propellerhead Software\Remote\Maps\Akai\"
echo "Remote Maps copied."

echo "---COMPLETE-------------------------XXX-"
