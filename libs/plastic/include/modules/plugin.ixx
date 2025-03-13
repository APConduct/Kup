//
// Created by Aidan Jost on 3/7/25.
//
module;
#include <memory>
#include <stdexcept>
#include <iostream>
# include <string>
# include  <unordered_map>
#include  <any>

export module plastic.plugin;

import plastic.app_context;


export namespace plastic
{
    // Interface for plugins
    class Plugin {
    public:
        virtual ~Plugin() = default;

        // Plugin lifecycle methods
        virtual void init() = 0;
        virtual void shutdown() = 0;
        virtual void update(float delta_time) {}

        // Plugin metadata
        [[nodiscard]] virtual std::string name() const = 0;
        [[nodiscard]] virtual std::string version() const = 0;
        [[nodiscard]] virtual std::string description() const = 0;
        [[nodiscard]] virtual std::string author() const = 0;
    };

    // Plugin manager to load, initialize and manage plugins
    class PluginManager {
    private:
        std::unordered_map<std::string, std::unique_ptr<Plugin>> plugins_;
        std::shared_ptr<context::AppContext> app_context_;

        // Registry for plugin services
        std::unordered_map<std::string, std::any> services_;

    public:
        explicit PluginManager(std::shared_ptr<context::AppContext> app_context)
            : app_context_(std::move(app_context)) {}

        template<typename T, typename... Args>
        T* register_plugin(Args&&... args) {
            auto plugin = std::make_unique<T>(std::forward<Args>(args)...);
            T* plugin_ptr = plugin.get();
            std::string plugin_name = plugin->name();

            if (plugins_.contains(plugin_name)) {
                throw std::runtime_error("Plugin with name " + plugin_name + " already exists");
            }

            plugins_[plugin_name] = std::move(plugin);
            return plugin_ptr;
        }

        void init_all() {
            for (auto& [name, plugin] : plugins_) {
                try {
                    plugin->init();
                } catch (const std::exception& e) {
                    // Log error and continue
                    std::cerr << "Failed to initialize plugin " << name << ": " << e.what() << std::endl;
                }
            }
        }

        void shutdown_all() {
            for (auto& [name, plugin] : plugins_) {
                try {
                    plugin->shutdown();
                } catch (const std::exception& e) {
                    // Log error and continue
                    std::cerr << "Failed to shut down plugin " << name << ": " << e.what() << std::endl;
                }
            }
        }

        void update_all(float delta_time) {
            for (auto& [name, plugin] : plugins_) {
                try {
                    plugin->update(delta_time);
                } catch (const std::exception& e) {
                    // Log error and continue
                    std::cerr << "Error updating plugin " << name << ": " << e.what() << std::endl;
                }
            }
        }

        Plugin* get_plugin(const std::string& name) {
            auto it = plugins_.find(name);
            if (it != plugins_.end()) {
                return it->second.get();
            }
            return nullptr;
        }

        void unload_plugin(const std::string& name) {
            auto it = plugins_.find(name);
            if (it != plugins_.end()) {
                it->second->shutdown();
                plugins_.erase(it);
            }
        }

        // Service registry for plugin communication
        template<typename T>
        void register_service(const std::string& name, T&& service) {
            services_[name] = std::any(std::forward<T>(service));
        }

        template<typename T>
        T* get_service(const std::string& name) {
            auto it = services_.find(name);
            if (it != services_.end()) {
                try {
                    return std::any_cast<T>(&it->second);
                } catch (const std::bad_any_cast&) {
                    return nullptr;
                }
            }
            return nullptr;
        }

        void remove_service(const std::string& name) {
            services_.erase(name);
        }
    };
}
