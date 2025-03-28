//
// Created by Aidan Jost on 2/15/25.
//

export module plastic.window_base;
import plastic.context;
import plastic.window_options;
import plastic.size;

export namespace plastic
{
    class WindowBase {
    public:
        virtual ~WindowBase() = default;

        [[nodiscard]] virtual int id() const = 0;
        virtual void request_close() = 0;
        virtual void update() = 0;
        virtual void render() = 0;
        virtual Context& context() = 0;
        [[nodiscard]] virtual bool should_close() const = 0;
        [[nodiscard]] virtual const window::WindowOptions& options() const = 0;
        virtual void handle_resize( Size<float>& size) = 0;
    };
}
