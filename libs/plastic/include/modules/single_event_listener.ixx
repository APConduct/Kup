//
// Created by ajost1 on 2/2/2025.
//

export module plastic.single_event_listener;
import plastic.event_dispatcher;

export namespace plastic
{
    template<typename Event>
class SingleEventListener {
    public:
        virtual ~SingleEventListener() = default;

    protected:
        EventDispatcher& dispatcher;

        explicit SingleEventListener(EventDispatcher& dispatcher) : dispatcher(dispatcher) {
            subscribe();
        }

        void subscribe() {
            dispatcher.subscribe<Event>([this](const Event& event) {
                this->handle(event);
            });
        }

        virtual void handle(const Event&) = 0;
    };
}
