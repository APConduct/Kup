//
// Created by ajost1 on 1/30/2025.
//

module;
#include <memory>
export module plastic.model_context;

import plastic.app_context;
import plastic.context;

export namespace plastic::context
{
    struct ModelContext {
        std::shared_ptr<AppContext> app_context_;
    };
}
