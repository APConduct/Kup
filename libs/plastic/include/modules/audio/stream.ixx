//
// Created by Aidan Jost on 3/2/25.
//
module;
#include <raylib.h>
export module plastic.audio.stream;
import plastic.audio.callback;
export namespace plastic::audio
{
    struct Stream {
        ::AudioStream rl_;
        static Stream from(const ::AudioStream& stream) {
            return Stream{stream};
        }
        [[nodiscard]] ::AudioStream rl() const {
            return rl_;
        }
        static Stream load(unsigned int sample_rate, unsigned int sample_size, unsigned int channels) {
            return Stream{::LoadAudioStream(sample_rate, sample_size, channels)};
        }
        void unload() const {
            UnloadAudioStream(rl_);
        }
        [[nodiscard]] bool is_valid() const {
            return IsAudioStreamValid(rl_);
        }

        [[nodiscard]] bool is_proccessed() const {
            return IsAudioStreamProcessed(rl_);
        }

        [[nodiscard]] bool is_playing() const {
            return IsAudioStreamPlaying(rl_);
        }

        void play() const {
            PlayAudioStream(rl_);
        }

        void pause() const {
            PauseAudioStream(rl_);
        }

        void stop() const {
            StopAudioStream(rl_);
        }

        void resume() const {
            ResumeAudioStream(rl_);
        }

        void set_pan(float pan) const {
            SetAudioStreamPan(rl_, pan);
        }

        void set_pitch(float pitch) const {
            SetAudioStreamPitch(rl_, pitch);
        }

        void set_volume(float volume) const {
            SetAudioStreamVolume(rl_, volume);
        }

        static void set_buffer_size_default(int size) {
            SetAudioStreamBufferSizeDefault(size);
        }

        void set_callback(const AudioCallback& callback) const {
            SetAudioStreamCallback(rl_, callback());
        }

        void set_callback(const ::AudioCallback callback) const {
            SetAudioStreamCallback(rl_, callback);
        }

        void attach_processor(const AudioCallback& callback) const {
            AttachAudioStreamProcessor(rl_, callback());
        }

        void detach_processor(AudioCallback callback) const {
            DetachAudioStreamProcessor(rl_, callback());
        }

    };
}