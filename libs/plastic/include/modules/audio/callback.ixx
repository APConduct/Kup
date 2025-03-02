//
// Created by Aidan Jost on 3/2/25.
//
module;
#include <raylib.h>
export module plastic.audio.callback;

export namespace plastic::audio
{
    struct AudioCallback {
        using Callback =   void(*)(void*, unsigned int) ;
        Callback callback_;
        AudioStream stream;
        unsigned long frames_per_buffer;

        [[nodiscard]] ::AudioCallback operator() () const {
            return callback_;
        };



    };


}