//
// Created by Aidan Jost on 3/7/25.
//


module;
#include <regex>
#include <string>
export module editor.syntax_highlighter;
import plastic.color;
import plastic;
import plastic.plugin;
import plastic.rich_text;
export namespace editor
{
    struct SyntaxRule {
        std::regex pattern;
        plastic::Color color;
        bool bold{false};
        bool italic{false};
    };

    class SyntaxHighlighter {
    private:
        std::vector<SyntaxRule> rules;
        std::string language_id;

    public:
        explicit SyntaxHighlighter(std::string language) : language_id(std::move(language)) {}

        void add_rule(const std::regex& pattern, const plastic::Color& color, bool bold = false, bool italic = false) {
            rules.push_back({pattern, color, bold, italic});
        }

        [[nodiscard]] std::vector<plastic::RichText::TextSpan> highlight(const std::string& text) const {
            std::vector<plastic::RichText::TextSpan> spans;
            // Implement the highlighting logic using regex matching
            // This is a simplified version - a real implementation would need to handle overlapping matches

            return spans;
        }
    };
}
