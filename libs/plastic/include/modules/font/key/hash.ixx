//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <string>
#include <functional>

export module plastic.font.key.hash;

import plastic.font.key;

export namespace plastic::font::key
{
    struct Hash {
        size_t operator()(const Key &key) const {
            return std::hash<std::string>()(key.family) ^ std::hash<int>()(static_cast<int>(key.weight));
        }
    };
}
