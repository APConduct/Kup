//
// Created by Aidan Jost on 3/4/25.
//

module;
#include <string>
#include <stack>
#if defined(_WIN32)
#include <memory>
#endif

export module plastic.command;

export namespace plastic
{
    struct Command {
        virtual ~Command() = default;
        virtual void execute() = 0;
        virtual void undo() = 0;
        [[nodiscard]] virtual std::string name() const = 0;
    };

    class CommandManager {
    private:
        std::stack<std::unique_ptr<Command>> undo_stack;
        std::stack<std::unique_ptr<Command>> redo_stack;

    public:
        void execute(std::unique_ptr<Command> cmd) {
            // Execute the command
            cmd->execute();

            // Add to undo stack
            undo_stack.push(std::move(cmd));

            // Clear redo stack since a new action was performed
            while (!redo_stack.empty()) {
                redo_stack.pop();
            }
        };
        [[nodiscard]] bool can_undo() const {
            return !undo_stack.empty();

        };
        [[nodiscard]] bool can_redo() const {
            return !redo_stack.empty();

        };
        void undo() {
            if (can_undo()) {
                // Get the command from undo stack
                auto cmd = std::move(undo_stack.top());
                undo_stack.pop();

                // Undo it
                cmd->undo();

                // Move to redo stack
                redo_stack.push(std::move(cmd));
            }

        };
        void redo() {
            if (can_redo()) {
                // Get the command from redo stack
                auto cmd = std::move(redo_stack.top());
                redo_stack.pop();

                // Execute it again
                cmd->execute();

                // Move back to undo stack
                undo_stack.push(std::move(cmd));
            }

        };
    };
}
