//
// Created by Aidan Jost on 3/2/25.
//
module;
#include <raylib.h>
#include <string>
export module plastic.sound;
import plastic.audio.wave;

export namespace plastic
{
    struct Sound {
        ::Sound rl_;
        static Sound from(const ::Sound& sound) {
            return Sound{sound};
        }
        [[nodiscard]] ::Sound rl() const {
            return rl_;
        }
        static Sound load(const std::string& fileName) {
            return Sound{::LoadSound(fileName.c_str())};
        }
        void unload() const {
            UnloadSound(rl_);
        }
        [[nodiscard]] bool is_valid() const {
            return IsSoundValid(rl());
        }

        void update(const void* data, int sample_count) const {
            UpdateSound(rl_, data, sample_count);
        }

        static Sound from(const ::Wave& wave) {
            return Sound{::LoadSoundFromWave(wave)};
        }

        [[nodiscard]] Sound alias() const{
            return Sound{::LoadSoundAlias(this->rl())};
        }

        void play() const {
            PlaySound(rl_);
        }

        void pause() const {
            PauseSound(rl_);
        }

        void stop() const {
            StopSound(rl_);
        }

        void resume() const {
            ResumeSound(rl_);
        }

        [[nodiscard]] bool is_playing() const {
            return IsSoundPlaying(rl_);
        }

        void set_volume(float volume) const {
            SetSoundVolume(rl_, volume);
        }

        void set_pitch(float pitch) const {
            SetSoundPitch(rl_, pitch);
        }

        void set_pan(float pan) const {
            SetSoundPan(rl_, pan);
        }




    };
}

