faust -a sndfile.cpp -o mindwave.cpp mindwave.dsp
g++ mindwave.cpp -I/usr/local/include -L/usr/local/lib -lsndfile -o mindwave
./mindwave null.wav mw.wav
rm mindwave.cpp
afplay mw.wav
