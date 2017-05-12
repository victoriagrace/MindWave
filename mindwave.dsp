import("stdfaust.lib");

import("vic.lib");

med = hslider("meditation", 0.5, 0, 1, 0.001) : si.smooth(ba.tau2pole(2));

//process = os.osc(scale(100, 1000, med)) * 0.5;

//process = breathylead(440);

process = lead_sound(64 + 12, med) : global_fx(med);
//process = lead_sound(64 + 12, med) * lscale(0.1, med);
//process = breathylead(64 + 12, med);

