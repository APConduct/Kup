//
// Created by ajost1 on 2/2/2025.
//
/// @file ref_count.ixx
/// @brief reference counting

module;
#include <atomic>
#include <mutex>
export module plastic.ref_count;

    template <typename T>
    struct Ref;
    template <typename T>
    struct WeakRef;

export namespace plastic
{
    struct RefCount {
    private:
        std::atomic<size_t> strong_count{0};
        std::atomic<size_t> weak_count{0};
        mutable std::mutex mutex;

    public:
        void increment_strong() {
            strong_count.fetch_add(1, std::memory_order_relaxed);
        }

        void decrement_strong() {
            strong_count.fetch_sub(1, std::memory_order_acq_rel);
            // if (strong_count.load(std::memory_order_relaxed) == 0) {
            //     delete this;
            // }
        }

        void increment_weak() {
            weak_count.fetch_add(1, std::memory_order_relaxed);
        }

        void decrement_weak() {
            weak_count.fetch_sub(1, std::memory_order_acq_rel);
            // if (weak_count.load(std::memory_order_relaxed) == 0) {
            //     delete this;
            // }
        }

        size_t get_strong_count() const {
            return strong_count.load(std::memory_order_acquire);
        }

        size_t get_weak_count() const {
            return weak_count.load(std::memory_order_acquire);
        }

        bool should_delete() const {
            return strong_count.load(std::memory_order_acquire) == 0 && weak_count.load(std::memory_order_acquire) == 0;
        }

        std::mutex& get_mutex() const {
            return mutex;
        }
    };

    class RefCounted {
        template <typename T> friend struct Ref;
        template <typename T> friend struct WeakRef;

    private:
        mutable RefCount ref_count;

    protected:
        virtual ~RefCounted() = default;

    public:
        RefCounted() = default;
        explicit RefCounted(const RefCounted&) = delete;
        RefCounted& operator=(const RefCounted&) = delete;

    };

    template <typename T>
    struct Ref {
        static_assert(std::is_base_of_v<RefCounted, T>, "T must be derived from RefCounted");
    private:
        T* ptr{nullptr};
    public:
        Ref() = default;
        explicit Ref(T* ptr) : ptr(ptr) {
            if (ptr) {
                ptr->ref_count.increment_strong();
            }
        }

        Ref(const Ref& other) : ptr(other.ptr) {
            if (ptr) {
                ptr->ref_count.increment_strong();
            }
        }

        Ref(Ref&& other) noexcept : ptr(other.ptr) {
            other.ptr = nullptr;
        }
        ~Ref() {
            if (ptr) {
                ptr->ref_count.decrement_strong();
                if (ptr->ref_count.get_strong_count() == 0) {
                    delete ptr;
                }
            }

        }
        Ref& operator=(const Ref& other) {
            if (this != &other) {
                if (ptr) {
                    ptr->ref_count.decrement_strong();
                    if (ptr->ref_count.get_strong_count() == 0) {
                        delete ptr;
                    }
                }
                ptr = other.ptr;
                if (ptr) {
                    ptr->ref_count.increment_strong();
                }
            }
            return *this;
        }

        Ref& operator=(Ref&& other) noexcept {
            if (this != &other) {
                if (ptr) {
                    ptr->ref_count.decrement_strong();
                    if (ptr->ref_count.get_strong_count() == 0) {
                        delete ptr;
                    }
                }
                ptr = other.ptr;
                other.ptr = nullptr;
            }
            return *this;
        }

        WeakRef<T> downgrade() const {
            return WeakRef<T>(ptr);
        }

        [[nodiscard]] bool is_null() const {
            return ptr == nullptr;
        }

        T* get() const {
            return ptr;
        }

        [[nodiscard]] size_t strong_count() const {
            return ptr ? ptr->ref_count.get_strong_count() : 0;
        }

        [[nodiscard]] size_t weak_count() const {
            return ptr ? ptr->ref_count.get_weak_count() : 0;
        }

        bool operator==(const Ref& other) const {
            return ptr == other.ptr;
        }

        bool operator!=(const Ref& other) const {
            return ptr != other.ptr;
        }

        bool operator==(std::nullptr_t) const {
            return ptr == nullptr;
        }

        bool operator!=(std::nullptr_t) const {
            return ptr != nullptr;
        }

        T* operator->() const {
            assert(ptr && "Dereferencing a null Ref");
            return ptr;
        }

        T& operator*() const {
            assert(ptr && "Dereferencing a null Ref");
            return *ptr;
        }

        // factory function
        template <typename... Args>
        static Ref make(Args&&... args) {
            return Ref(new T(std::forward<Args>(args)...));
        }

        template <typename F>
        void modify(F&& f) {
            if (ptr) {
                std::lock_guard lock(ptr->ref_count.get_mutex());
                f(*ptr);
            }
        }

    };

    template <typename T>
    struct WeakRef {
        static_assert(std::is_base_of_v<RefCounted, T>, "T must be derived from RefCounted");

    private:
        T* ptr{nullptr};
    public:
        WeakRef() = default;
        explicit WeakRef(T* ptr) : ptr(ptr) {
            if (ptr) {
                ptr->ref_count.increment_weak();
            }
        }

        WeakRef(const WeakRef& other) : ptr(other.ptr) {
            if (ptr) {
                ptr->ref_count.increment_weak();
            }
        }

        WeakRef(WeakRef&& other) noexcept : ptr(other.ptr) {
            other.ptr = nullptr;
        }

        ~WeakRef() {
            if (ptr) {
                ptr->ref_count.decrement_weak();
                if (ptr->ref_count.get_weak_count() == 0 && ptr->ref_count.get_strong_count() == 0) {
                    delete ptr;
                }
            }
        }

        WeakRef& operator=(const WeakRef& other) {
            if (this != &other) {
                if (ptr) {
                    ptr->ref_count.decrement_weak();
                    if (ptr->ref_count.get_weak_count() == 0 && ptr->ref_count.get_strong_count() == 0) {
                        delete ptr;
                    }
                }
                ptr = other.ptr;
                if (ptr) {
                    ptr->ref_count.increment_weak();
                }
            }
            return *this;
        }

        WeakRef& operator=(WeakRef&& other) noexcept {
            if (this != &other) {
                if (ptr) {
                    ptr->ref_count.decrement_weak();
                    if (ptr->ref_count.get_weak_count() == 0 && ptr->ref_count.get_strong_count() == 0) {
                        delete ptr;
                    }
                }
                ptr = other.ptr;
                other.ptr = nullptr;
            }
            return *this;
        }

        Ref<T> upgrade() const {
            if (ptr && ptr->ref_count.get_strong_count() > 0) {
                return Ref<T>(ptr);
            }
            return Ref<T>();
        }

        [[nodiscard]] bool expired() const {
            return !ptr || ptr->ref_count.get_strong_count() == 0;
        }

        [[nodiscard]] bool is_null() const {
            return ptr == nullptr;
        }

        [[nodiscard]] size_t use_count() const {
            return ptr ? ptr->ref_count.get_strong_count() : 0;
        }
    };



}
