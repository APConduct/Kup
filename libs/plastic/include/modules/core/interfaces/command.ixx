module;
#include <memory>
#include <ranges>
#include <stack>
#include <string>
#include <vector>
#ifdef __WIN32
#include <functional>
#endif

export module plastic.command;

export namespace plastic {
    /// @brief Interface for commands in command pattern
    struct Command {
        /// @brief Default destructor
        virtual ~Command() = default;
        
        /// @brief Execute the command
        virtual void execute() = 0;
        
        /// @brief Undo the command
        virtual void undo() = 0;
        
        /// @brief Get the name of the command
        [[nodiscard]] virtual std::string name() const = 0;
    };
    
    /// @brief Composite command that executes multiple commands as one
    class BatchCommand : public Command {
    private:
        std::vector<std::unique_ptr<Command>> commands_;
        std::string name_{"Batch Command"};
        
    public:
        /// @brief Default constructor
        BatchCommand() = default;
        
        /// @brief Constructor with a name
        explicit BatchCommand(std::string name) : name_(std::move(name)) {}

        explicit BatchCommand(std::vector<std::unique_ptr<Command>> commands, std::string name = "Batch")
            : commands_(std::move(commands)), name_(std::move(name)) {}

        
        /// @brief Add a command to the batch
        void add_command(std::unique_ptr<Command> command) {
            commands_.push_back(std::move(command));
        }
        
        /// @brief Execute all commands in the batch
        void execute() override {
            for (auto& cmd : commands_) {
                cmd->execute();
            }
        }
        
        /// @brief Undo all commands in the batch in reverse order
        void undo() override {
            for (auto & command : std::ranges::reverse_view(commands_)) {
                command->undo();
            }
        }
        
        /// @brief Get the name of the batch command
        [[nodiscard]] std::string name() const override {
            return name_;
        }
        
        /// @brief Check if the batch is empty
        [[nodiscard]] bool is_empty() const {
            return commands_.empty();
        }
    };
    
    /// @brief Stack for storing commands
    using CommandStack = std::stack<std::unique_ptr<Command>>;
    
    /// @brief Manager for commands, providing undo/redo functionality
    class CommandManager {
    private:
        CommandStack undo_stack_;
        CommandStack redo_stack_;
        
        // Batch operation support
        int batch_level_{0};
        std::vector<std::unique_ptr<Command>> batch_commands_;
        std::unique_ptr<BatchCommand> current_batch_command_;
        
    public:
        /// @brief Default constructor
        CommandManager() = default;



        /// @brief Execute a command and add it to the undo stack
        void execute(std::unique_ptr<Command> command) {
            if (batch_level_ > 0) {
                // We're in a batch operation, add to the current batch
                batch_commands_.push_back(std::move(command));
                return;
            }
            
            // Execute the command
            command->execute();
            
            // Add to undo stack
            undo_stack_.push(std::move(command));
            
            // Clear redo stack when a new command is added
            redo_stack_ = CommandStack();
        }
        
        /// @brief Undo the last command
        void undo() {
            if (can_undo()) {
                auto cmd = std::move(undo_stack_.top());
                undo_stack_.pop();
                
                cmd->undo();
                redo_stack_.push(std::move(cmd));
            }
        }
        
        /// @brief Redo the last undone command
        void redo() {
            if (can_redo()) {
                auto cmd = std::move(redo_stack_.top());
                redo_stack_.pop();
                
                cmd->execute();
                undo_stack_.push(std::move(cmd));
            }
        }
        
        /// @brief Check if undo is possible
        [[nodiscard]] bool can_undo() const {
            return !undo_stack_.empty();
        }
        
        /// @brief Check if redo is possible
        [[nodiscard]] bool can_redo() const {
            return !redo_stack_.empty();
        }
        
        /// @brief Begin a batch operation
        /// @note Batch operations can be nested
        void begin_batch() {
            if (batch_level_ == 0) {
                current_batch_command_ = std::make_unique<BatchCommand>();
                batch_commands_.clear();
            }
            batch_level_++;
        }
        
        /// @brief Ends a batch operation.
        /// @note This method should be called after a series of commands that should be treated as a single unit.
        void end_batch() {
            if (batch_level_ > 0) {
                batch_level_--;
                
                if (batch_level_ == 0 && !batch_commands_.empty()) {
                    // Create a batch command with all collected commands
                    for (auto& cmd : batch_commands_) {
                        current_batch_command_->add_command(std::move(cmd));
                    }
                    
                    // Execute the batch command
                    current_batch_command_->execute();
                    
                    // Add to undo stack
                    undo_stack_.push(std::move(current_batch_command_));
                    
                    // Clear batch state
                    batch_commands_.clear();
                    redo_stack_ = CommandStack(); // Clear redo stack when a new command is added
                }
            }
        }
        
        /// @brief Set a name for the current batch
        /// @param name The name for the batch
        void set_batch_name(const std::string& name) {
            if (batch_level_ > 0 && current_batch_command_) {
                current_batch_command_ = std::make_unique<BatchCommand>(name);
            }
        }
        
        /// @brief Cancel the current batch operation
        void cancel_batch() {
            if (batch_level_ > 0) {
                batch_level_ = 0;
                batch_commands_.clear();
                current_batch_command_.reset();
            }
        }
    };
}