//
// Created by Aidan Jost on 3/4/25.
//
//// @file command.ixx

module;
#include <string>
#include <stack>
#if defined(_WIN32)
#include <memory>
#endif

export module plastic.command;

export namespace plastic
{

    /// @brief Command interface. Represents a command that can be executed and undone.
    /// @note This interface is used for the command pattern, allowing for undo/redo functionality.
    struct Command {

        /// @brief virtual destructor
        virtual ~Command() = default;

        /// @brief Execute the command.
        virtual void execute() = 0;

        /// @brief Undo the command.
        virtual void undo() = 0;

        /// @brief get the name of the command
        [[nodiscard]] virtual std::string name() const = 0;
    };

    /// @brief CommandManager class. Manages a stack of commands for undo/redo functionality.
    /// @note This class is used to manage the execution and undoing of commands.
    class CommandManager {
    private:

        /// @brief Stack for undo commands
        std::stack<std::unique_ptr<Command>> undo_stack;

        /// @brief Stack for redo commands
        std::stack<std::unique_ptr<Command>> redo_stack;

    public:

        /// @brief execute a command
        /// @param cmd The command to execute
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

        /// @brief check if there are any commands to undo or redo
        /// @return true if there are commands to undo or redo, false otherwise
        [[nodiscard]] bool can_undo() const {
            return !undo_stack.empty();

        };

        /// @brief check if there are any commands to redo
        /// @return true if there are commands to redo, false otherwise
        [[nodiscard]] bool can_redo() const {
            return !redo_stack.empty();
        };

        /// @brief undo the last command
        /// @note This function will only work if there is a command to undo
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

        /// @brief redo the last undone command
        /// @note This function will only work if there is a command to redo
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
