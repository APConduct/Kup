//
// Created by Aidan Jost on 3/2/25.
//
module;
#include <raylib.h>
export module plastic.audio.device;

export namespace plastic::audio
{
    struct Device {
        static void init() {
            InitAudioDevice();
        }

        static void close() {
            CloseAudioDevice();
        }

        static bool is_initialized() {
            return IsAudioDeviceReady();
        }

        [[nodiscard]] static float volume() {
            return GetMasterVolume();
        }
    };
}
