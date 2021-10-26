# reason-mpk-mini-mk3
Reason Remote files for Akai MPK Mini MKIII


# Objectives
* Create a working set of remote files for the new Akai MPK Mini MKIII, which currently does not have a supported set of mappings.  The MKII mappings do not work.


# Install for macOS
Copy and paste the following command to install the appropriate Lua and Remote files.

You will be _prompted for your macOS user password_ to move the files to the correct location. This is a one time event.
```
git clone git@github.com:philoSurfer/reason-mpk-mini-mk3.git && cd reason-mpk-mini-mk3;
sudo sh ./install-macOS.sh;
```

Once installed, restart Reason and proceed to plugin your MPK Mini MK3 and mannualy add it via the settings


# Install for Windows - NOT WORKING
I need help with a windows script to install, as I do not have a windows machine to test on.PRs accepeted


# Contribution - Remote mapping
If you would like to work on adding remote maps, feel free to edit the appropriate files and submit PRs.   

You can edit the files in the cloned repo and re-run the install script to copy the changes to the default production environment for these files.

# Program Change Controls Mapping

The following is the current "Prog Change" mapping

| Button | Function|
| :---: | ------|
| __A1__ | Stop |
| __A2__ | Play |
| __A3__ | Record |
| __A4__ | Target Next Track |
| __A5__ | Click On/Off |
| __A6__ | Loop On/Off |
| __A7__ | Auto-quantize |
| __A8__ | Target Previous Track |
| __Button__ | __Function__ |
| __B9__ | Select Prev Patch for Target Device |
| __B10__ | |
| __B11__ | |
| __B12__ | |
| __B13__ | Select Next Patch for Target Device |
| __B14__ | |
| __B15__ | |
| __B16__ | |
