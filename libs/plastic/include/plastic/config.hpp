#ifndef PLASTIC_CONFIG_HPP
#define PLASTIC_CONFIG_HPP

// Degug configuration
#if !defined(NDEBUG) || defined(_DEBUG)
    #define PLASTIC_DEBUG
#endif

// Debug levels
#ifdef PLASTIC_DEBUG
    #define PLASTIC_DEBUG_LEVEL 1 // 1: Basic, 2: Verbose, 3: Very Verbose
#endif

// Enable/disable specific features
#ifndef PLASTIC_DEBUG
    #define PLASTIC_DEBUG_EVENTS
    #define PLASTIC_DEBUG_LOGGING
    // #define PLASTIC_DEBUG_PROFILING
#endif

#endif //PLASTIC_CONFIG_HPP
