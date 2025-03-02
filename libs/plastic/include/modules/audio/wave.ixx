//
// Created by Aidan Jost on 3/2/25.
//
module;
#include <raylib.h>
#include <string>
export module plastic.audio.wave;

namespace plastic::audio
{
    struct Wave {
        ::Wave rl_;
        static Wave from(const ::Wave& wave) {
            return Wave{wave};
        }
        [[nodiscard]] ::Wave rl() const {
            return rl_;
        }
        static Wave load(const std::string& fileName) {
            return Wave{::LoadWave(fileName.c_str())};
        }
        void unload() const {
            UnloadWave(rl_);
        }

        static Wave from_memory(const std::string& file_type, const unsigned char* file_data, const int size) {
            return Wave{::LoadWaveFromMemory(file_type.c_str(), file_data, size)};
        }

        [[nodiscard]] bool is_valid() const {
            return rl_.data != nullptr;
        }

        bool operator==(const Wave& other) const {
            return rl_.data == other.rl_.data&&
                rl_.channels == other.rl_.channels &&
                    rl_.frameCount == other.rl_.frameCount &&
                        rl_.sampleSize == other.rl_.sampleSize &&
                            rl_.sampleRate == other.rl_.sampleRate;
        }
        bool operator!=(const Wave& other) const {
            return !(*this == other);
        }

        [[nodiscard]] unsigned int get_sample_rate() const {
            return rl_.sampleRate;
        }

        [[nodiscard]] unsigned int get_channels() const {
            return rl_.channels;
        }

        [[nodiscard]] unsigned int get_frame_count() const {
            return rl_.frameCount;
        }

        [[nodiscard]] unsigned int get_sample_size() const {
            return rl_.sampleSize;
        }

        void update(const unsigned char* data, int size) {
            if (rl_.data != nullptr) {
                rl_.data = const_cast<unsigned char*>(data);
                rl_.frameCount = size / (rl_.channels * rl_.sampleSize);
            }
        }

        void format(const int sample_rate, const int channels, const int sample_size) {
            if (rl_.data != nullptr) {
                ::WaveFormat(&rl_, sample_rate, sample_size, channels);
            }
        }

        void crop(const int start_frame, const int end_frame) {
            if (rl_.data != nullptr) {
                ::WaveCrop(&rl_, start_frame, end_frame);
            }
        }

        [[nodiscard]] float* load_samples() const {
            return ::LoadWaveSamples(rl_);
        }

        static void unload_samples(float* samples) {
            UnloadWaveSamples(samples);
        }

    };
}
