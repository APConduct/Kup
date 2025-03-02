//
// Created by Aidan Jost on 3/2/25.
//
module;
#include <raylib.h>
export module audio;
import plastic.audio.device;
export import plastic.audio.wave;
export import plastic.audio.stream;
export import plastic.sound;
export import plastic.music;
export import plastic.audio.device;
export import plastic.audio.callback;
export namespace plastic::audio
{
    void attach_audio_mixed_processor(const audio::AudioCallback& processor) {
        AttachAudioMixedProcessor(processor());
    }

    void detach_audio_mixed_processor(const audio::AudioCallback& processor) {
        DetachAudioMixedProcessor(processor());
    }

    void init_audio_device() {
        Device::init();
    }
    void close_audio_device() {
        Device::close();
    }
}