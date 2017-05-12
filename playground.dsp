import("stdfaust.lib");
//counter = ba.beat(120);

med = hslider("meditation", 0.5, 0, 1, 0.001);

fm(freq, mod, car, idx) = os.osc(freq*car+  idx*freq*mod*os.osc(mod*freq));

biscale(mn, mx, in) = 0.5 * (1 + in) * (mx - mn) + mn;

clock = ba.beat(120 * 16);

env(clk) = clk : ba.toggle : en.ar(0.002, 0.02);

index_lfo = biscale(0, 4, os.osc(0.1));

urandh(ns, t) = ns : ba.sAndH(t);

trand(mn, mx, ns, t) = urandh(ns, t) : biscale(mn, mx);

maytrig(prob, ns, t) = trand(0, 1, ns, t) : _ < prob : _ * t;


clicks(freq, clock) = fm(freq, 1, 1, index_lfo) * env(clock) * 0.5;


rclock(ns) = clock : maytrig(0.1, ns); 


click_sound(rate, ns) = rclock(ns) : clicks(rate);

process = no.multinoise(10) : par(i, 10, click_sound(100 * i)) :> _ / 10;

//process = no.noise : click_sound(100);

