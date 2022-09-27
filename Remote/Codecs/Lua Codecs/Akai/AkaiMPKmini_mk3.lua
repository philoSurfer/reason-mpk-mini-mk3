
function remote_init()
    local items={
        {name="Keyboard", input="keyboard"},
        {name="Pitch Bend", input="value", min=0, max=16383},
        {name="Mod Up", input="value", min=0, max=127},
        {name="Mod Down", input="value", min=0, max=127},
        {name="Sustain", input="value", min=0, max=127},
        {name="Knob 1", input="delta"},
        {name="Knob 2", input="delta"},
        {name="Knob 3", input="delta"},
        {name="Knob 4", input="delta"},
        {name="Knob 5", input="delta"},
        {name="Knob 6", input="delta"},
        {name="Knob 7", input="delta"},
        {name="Knob 8", input="delta"},

        {name="Pad Button A1", input="button"},
        {name="Pad Button A2", input="button"},
        {name="Pad Button A3", input="button"},
        {name="Pad Button A4", input="button"},
        {name="Pad Button A5", input="button"},
        {name="Pad Button A6", input="button"},
        {name="Pad Button A7", input="button"},
        {name="Pad Button A8", input="button"},

        {name="Pad Button B1", input="button"},
        {name="Pad Button B2", input="button"},
        {name="Pad Button B3", input="button"},
        {name="Pad Button B4", input="button"},
        {name="Pad Button B5", input="button"},
        {name="Pad Button B6", input="button"},
        {name="Pad Button B7", input="button"},
        {name="Pad Button B8", input="button"},

        {name="Prog Change 1", input="button"},
        {name="Prog Change 2", input="button"},
        {name="Prog Change 3", input="button"},
        {name="Prog Change 4", input="button"},
        {name="Prog Change 5", input="button"},
        {name="Prog Change 6", input="button"},
        {name="Prog Change 7", input="button"},
        {name="Prog Change 8", input="button"},
        {name="Prog Change 9", input="button"},
        {name="Prog Change 10", input="button"},
        {name="Prog Change 11", input="button"},
        {name="Prog Change 12", input="button"},
        {name="Prog Change 13", input="button"},
        {name="Prog Change 14", input="button"},
        {name="Prog Change 15", input="button"},
        {name="Prog Change 16", input="button"},
    }
    remote.define_items(items)

    local inputs={
        {pattern="b? 46 <0y??>x", name="Knob 1", value="x-(16*y)"},
        {pattern="b? 47 <0y??>x", name="Knob 2", value="x-(16*y)"},
        {pattern="b? 48 <0y??>x", name="Knob 3", value="x-(16*y)"},
        {pattern="b? 49 <0y??>x", name="Knob 4", value="x-(16*y)"},
        {pattern="b? 4A <0y??>x", name="Knob 5", value="x-(16*y)"},
        {pattern="b? 4B <0y??>x", name="Knob 6", value="x-(16*y)"},
        {pattern="b? 4C <0y??>x", name="Knob 7", value="x-(16*y)"},
        {pattern="b? 4D <0y??>x", name="Knob 8", value="x-(16*y)"},

        -- Read notes from keyboard
        {pattern="8? xx yy", name="Keyboard", value="0", note="x", velocity="64"},
        {pattern="9? xx 00", name="Keyboard", value="0", note="x", velocity="64"},
        {pattern="<100x>? yy zz", name="Keyboard"},

    		{pattern="e? xx yy", name="Pitch Bend", value="y*128 + x"},
    		{pattern="b? 01 xx", name="Mod Up"},
    		{pattern="b? 0b xx", name="Mod Down"},
        {pattern="b? 40 xx", name="Sustain"},

        -- pad CCs
        {pattern="b? 10 xx", name="Pad Button A1", value="1"},
        {pattern="b? 11 xx", name="Pad Button A2", value="1"},
        {pattern="b? 12 xx", name="Pad Button A3", value="1"},
        {pattern="b? 13 xx", name="Pad Button A4", value="1"},
        {pattern="b? 14 xx", name="Pad Button A5", value="1"},
        {pattern="b? 15 xx", name="Pad Button A6", value="1"},
        {pattern="b? 16 xx", name="Pad Button A7", value="1"},
        {pattern="b? 17 xx", name="Pad Button A8", value="1"},

        {pattern="b? 18 xx", name="Pad Button B1", value="1"},
        {pattern="b? 19 xx", name="Pad Button B2", value="1"},
        {pattern="b? 1A xx", name="Pad Button B3", value="1"},
        {pattern="b? 1B xx", name="Pad Button B4", value="1"},
        {pattern="b? 1C xx", name="Pad Button B5", value="1"},
        {pattern="b? 1D xx", name="Pad Button B6", value="1"},
        {pattern="b? 1E xx", name="Pad Button B7", value="1"},
        {pattern="b? 1F xx", name="Pad Button B8", value="1"},

        -- pad Program Change
        {pattern="C? 00", name="Prog Change 1", value="1"},
        {pattern="C? 01", name="Prog Change 2", value="1"},
        {pattern="C? 02", name="Prog Change 3", value="1"},
        {pattern="C? 03", name="Prog Change 4", value="1"},
        {pattern="C? 04", name="Prog Change 5", value="1"},
        {pattern="C? 05", name="Prog Change 6", value="1"},
        {pattern="C? 06", name="Prog Change 7", value="1"},
        {pattern="C? 07", name="Prog Change 8", value="1"},
        {pattern="C? 08", name="Prog Change 9", value="1"},
        {pattern="C? 09", name="Prog Change 10", value="1"},
        {pattern="C? 0a", name="Prog Change 11", value="1"},
        {pattern="C? 0b", name="Prog Change 12", value="1"},
        {pattern="C? 0c", name="Prog Change 13", value="1"},
        {pattern="C? 0d", name="Prog Change 14", value="1"},
        {pattern="C? 0e", name="Prog Change 15", value="1"},
        {pattern="C? 0f", name="Prog Change 16", value="1"},
    }
    remote.define_auto_inputs(inputs)
end


function remote_probe()
  return {

	  request="F0 7E 7F 06 01 F7",
    -- Mfg ID: '0x47' --> AKAI
    -- Dev ID: '0x49' --> MPK mini mk.III
    response="F0 7E 7F 06 02 47 49 00 19 00 01 02 06 00 00 00 00 00 45 38 32 31 31 30 32 34 39 33 31 37 36 32 32 00 F7"
}
end


function remote_prepare_for_use()
  return {

    -- Write Reason settings to RAM.
    -- Write code:'0x64'
		remote.make_midi("F0 47 7F 49 64 01 76 00 52 65 61 73 6F 6E 31 32 00 00 00 00 00 00 00 00 09 01 00 04 00 02 04 00 01 00 03 00 78 00 00 00 00 02 01 01 24 00 10 25 01 11 26 02 12 27 03 13 28 04 14 29 05 15 2A 06 16 2B 07 17 2C 08 18 2D 09 19 2E 0A 1A 2F 0B 1B 30 0C 1C 31 0D 1D 32 0E 1E 33 0F 1F 01 46 00 7F 4B 6E 6F 62 31 00 00 00 00 00 00 00 00 00 00 00 01 47 00 7F 4B 6E 6F 62 32 00 00 00 00 00 00 00 00 00 00 00 01 48 00 7F 4B 6E 6F 62 33 00 00 00 00 00 00 00 00 00 00 00 01 49 00 7F 4B 6E 6F 62 34 00 00 00 00 00 00 00 00 00 00 00 01 4A 00 7F 4B 6E 6F 62 35 00 00 00 00 00 00 00 00 00 00 00 01 4B 00 7F 4B 6E 6F 62 36 00 00 00 00 00 00 00 00 00 00 00 01 4C 00 7F 4B 6E 6F 62 37 00 00 00 00 00 00 00 00 00 00 00 01 4D 00 7F 4B 6E 6F 62 38 00 00 00 00 00 00 00 00 00 00 00 0C F7"),
}
end
