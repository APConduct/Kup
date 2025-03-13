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
        void execute(std::unique_ptr<Command> cmd);
        [[nodiscard]] bool can_undo() const;
        [[nodiscard]] bool can_redo() const;
        void undo();
        void redo();
    };
}
