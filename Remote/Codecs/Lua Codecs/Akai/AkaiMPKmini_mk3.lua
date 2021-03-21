
function remote_init()
    local items={
    {name="Keyboard", input="keyboard"},
		{name="Pitch Bend", input="value", min=0, max=16383},
		{name="Mod Up", input="value", min=0, max=127},
		{name="Mod Down", input="value", min=0, max=127},
    {name="Sustain", input="value", min=0, max=127},
		{name="Knob 1", input="value", min=0, max=127},
		{name="Knob 2", input="value", min=0, max=127},
		{name="Knob 3", input="value", min=0, max=127},
		{name="Knob 4", input="value", min=0, max=127},
		{name="Knob 5", input="value", min=0, max=127},
		{name="Knob 6", input="value", min=0, max=127},
		{name="Knob 7", input="value", min=0, max=127},
		{name="Knob 8", input="value", min=0, max=127},

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

        {pattern="b? 46 xx", name="Knob 1"},
        {pattern="b? 47 xx", name="Knob 2"},
        {pattern="b? 48 xx", name="Knob 3"},
        {pattern="b? 49 xx", name="Knob 4"},
        {pattern="b? 4A xx", name="Knob 5"},
        {pattern="b? 4B xx", name="Knob 6"},
        {pattern="b? 4C xx", name="Knob 7"},
        {pattern="b? 4D xx", name="Knob 8"},

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
    response="F0 7E 7F 06 02 47 26 00 19 00 22 00 22 00 00 00 00 00 00 00 04 00 04 00 03 00 78 00 2C 2D 2E 2F 30 F7"
}
end


function remote_prepare_for_use()
  return {

    --Write Reason settings to RAM.
		--remote.make_midi("F0 47 00 26 64 00 6D 00 00 00 04 00 00 04 00 00 00 03 00 78 00 00 00 01 02 0B 01 24 00 14 00 25 01 15 00 26 02 16 00 27 03 17 00 28 04 18 00 29 05 19 00 2A 06 1A 00 2B 07 1B 00 2C 08 1C 00 2D 09 1D 00 2E 0A 1E 00 2F 0B 1F 00 30 0C 20 00 31 0D 21 00 32 0E 22 00 33 0F 23 00 02 00 7F 03 00 7F 04 00 7F 05 00 7F 06 00 7F 07 00 7F 08 00 7F 09 00 7F 0C F7"),

    --Change to preset 1.
    -- remote.make_midi("F0 47 7F 7C 62 00 01 01 F7"),
}
end
