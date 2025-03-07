//
// Created by Aidan Jost on 3/7/25.
//

module;
#include <ranges>
#include <string>
#include <vector>
#include <fstream>
#include <functional>
#include <stack>
export module plastic.history;

import plastic.command;


export namespace plastic
{

    class BatchCommand : public Command {
    private:
        std::vector<std::unique_ptr<Command>> commands_;
        std::string batch_name_;

    public:
        explicit BatchCommand(std::vector<std::unique_ptr<Command>> commands, std::string name = "Batch")
            : commands_(std::move(commands)), batch_name_(std::move(name)) {}

        void execute() override {
            for (auto& cmd : commands_) {
                cmd->execute();
            }
        }

        void undo() override {
            // Undo in reverse order
            for (auto & command : std::ranges::reverse_view(commands_)) {
                command->undo();
            }
        }

        [[nodiscard]] std::string name() const override {
            return batch_name_;
        }
    };

    class HistoryManager {
    private:
        std::stack<std::unique_ptr<Command>> undo_stack_;
        std::stack<std::unique_ptr<Command>> redo_stack_;
        size_t max_history_size_{100};
        size_t batch_level_{0};
        std::vector<std::unique_ptr<Command>> current_batch_;
        std::function<void()> on_history_changed_;

    public:
        void execute(std::unique_ptr<Command> cmd) {
            if (!cmd) return;

            cmd->execute();

            if (batch_level_ > 0) {
                current_batch_.push_back(std::move(cmd));
            } else {
                add_to_history(std::move(cmd));
            }

            // Clear redo stack when a new command is executed
            while (!redo_stack_.empty()) {
                redo_stack_.pop();
            }

            if (on_history_changed_) {
                on_history_changed_();
            }
        }

        void begin_batch() {
            batch_level_++;
        }

        void end_batch() {
            if (batch_level_ > 0) {
                batch_level_--;

                if (batch_level_ == 0 && !current_batch_.empty()) {
                    // Create a composite command from the batch
                    auto batch_cmd = std::make_unique<BatchCommand>(std::move(current_batch_));
                    add_to_history(std::move(batch_cmd));
                    current_batch_.clear();

                    if (on_history_changed_) {
                        on_history_changed_();
                    }
                }
            }
        }

        [[nodiscard]] bool can_undo() const {
            return !undo_stack_.empty();
        }

        [[nodiscard]] bool can_redo() const {
            return !redo_stack_.empty();
        }

        void undo() {
            if (!can_undo()) return;

            auto cmd = std::move(undo_stack_.top());
            undo_stack_.pop();

            cmd->undo();
            redo_stack_.push(std::move(cmd));

            if (on_history_changed_) {
                on_history_changed_();
            }
        }

        void redo() {
            if (!can_redo()) return;

            auto cmd = std::move(redo_stack_.top());
            redo_stack_.pop();

            cmd->execute();
            undo_stack_.push(std::move(cmd));

            if (on_history_changed_) {
                on_history_changed_();
            }
        }

        void clear() {
            while (!undo_stack_.empty()) undo_stack_.pop();
            while (!redo_stack_.empty()) redo_stack_.pop();
            current_batch_.clear();
            batch_level_ = 0;

            if (on_history_changed_) {
                on_history_changed_();
            }
        }

        void set_max_history_size(size_t size) {
            max_history_size_ = size;
            trim_history();
        }

        void set_on_history_changed(std::function<void()> callback) {
            on_history_changed_ = std::move(callback);
        }

    protected:
        std::vector<std::string> undo_command_names_;
        std::vector<std::string> redo_command_names_;

    public:

        [[nodiscard]] std::vector<std::string> get_undo_command_names() const {
            return undo_command_names_;
        }

        [[nodiscard]] std::vector<std::string> get_redo_command_names() const {
            return redo_command_names_;
        }

    private:
        void add_to_history(std::unique_ptr<Command> cmd) {
            undo_command_names_.push_back(cmd->name());
            undo_stack_.push(std::move(cmd));
            trim_history();
        }

        void trim_history() {
            while (undo_stack_.size() > max_history_size_) {
                undo_stack_.pop();
            }
        }

    };

}
