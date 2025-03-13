//
// Created by Aidan Jost on 3/13/25.
//

module;
#include <string>
export module plastic.font.key;
import plastic.font.weight;

export namespace plastic::font
{
    struct Key {
        std::string family;
        Weight weight;

        bool operator==(const Key &other) const {
            return family == other.family && weight == other.weight;
        }

    };
}
