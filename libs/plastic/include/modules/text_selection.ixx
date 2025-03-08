//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <vector>
export module plastic.text_selection;


export namespace plastic
{
    struct TextSelection {
        size_t start;
        size_t end;

        [[nodiscard]] bool is_empty() const { return start == end; }
        [[nodiscard]] bool is_backward() const { return end < start; }

        [[nodiscard]] size_t min() const { return std::min(start, end); }
        [[nodiscard]] size_t max() const { return std::max(start, end); }

        void normalize() {
            if (is_backward()) {
                std::swap(start, end);
            }
        }
    };

    class SelectionManager {
    private:
        std::vector<TextSelection> selections;

    public:
        void add_selection(TextSelection selection) {
            selection.normalize();
            selections.push_back(selection);
            merge_overlapping();
        }

        void clear_selections() {
            selections.clear();
        }

        [[nodiscard]] const std::vector<TextSelection>& get_selections() const {
            return selections;
        }

        void extend_last_selection(size_t pos) {
            if (!selections.empty()) {
                selections.back().end = pos;
            } else {
                selections.push_back({pos, pos});
            }
        }

    private:
        void merge_overlapping() {
            if (selections.size() <= 1) return;

            std::ranges::sort(selections,
                              [](const auto& a, const auto& b) {
                                  return a.min() < b.min();
                              });

            std::vector<TextSelection> merged;
            merged.push_back(selections[0]);

            for (size_t i = 1; i < selections.size(); ++i) {
                auto& current = merged.back();
                const auto& next = selections[i];

                if (next.min() <= current.max()) {
                    // Overlapping - merge
                    current.end = std::max(current.max(), next.max());
                } else {
                    // Not overlapping - add new selection
                    merged.push_back(next);
                }
            }

            selections = std::move(merged);
        }
    };

}