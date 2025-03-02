//
// Created by Aidan Jost on 3/2/25.
//
module;
#include <raylib.h>
#include <string>
export module plastic.music;

import plastic.audio.wave;
import plastic.audio.stream;
import plastic.sound;

export namespace plastic::audio
{
    struct Music {
        ::Music rl_;
        static Music from(const ::Music& music) {
            return Music{music};
        }
        [[nodiscard]] ::Music rl() const {
            return rl_;
        }
        static Music load(const std::string& fileName) {
            return Music{::LoadMusicStream(fileName.c_str())};
        }
        static Music from_memory(const std::string& file_type, const unsigned char* file_data, const int size) {
            return Music{::LoadMusicStreamFromMemory(file_type.c_str(), file_data, size)};
        }
        void unload() const {
            UnloadMusicStream(rl_);
        }

        [[nodiscard]] bool is_valid() const {
            return IsMusicValid(rl_);
        }

        void play() const {
            PlayMusicStream(rl_);
        }

        [[nodiscard]] bool is_playing() const {
            return IsMusicStreamPlaying(rl_);
        }

        void pause() const {
            PauseMusicStream(rl_);
        }

        void update() const {
            UpdateMusicStream(rl_);
        }

        void stop() const {
            StopMusicStream(rl_);
        }

        void resume() const {
            ResumeMusicStream(rl_);
        }

        void seek(float position) const {
            SeekMusicStream(rl_, position);
        }

        [[nodiscard]] float get_time_length() const {
            return GetMusicTimeLength(rl_);
        }

        [[nodiscard]] float get_time_played() const {
            return GetMusicTimePlayed(rl_);
        }

        void set_volume(float volume) const {
            SetMusicVolume(rl_, volume);
        }

        void set_pitch(float pitch) const {
            SetMusicPitch(rl_, pitch);
        }

        void set_pan(float pan) const {
            SetMusicPan(rl_, pan);
        }
    };
}
