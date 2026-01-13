find_path(
    7Z_COMMON_INCLUDE_PATH
    MyCom.h
    PATHS
        "${CMAKE_CURRENT_LIST_DIR}/CPP/Common"
    NO_DEFAULT_PATH
)

find_path(
    7Z_WINDOWS_INCLUDE_PATH
    PropVariant.h
    PATHS
        "${CMAKE_CURRENT_LIST_DIR}/CPP/Windows"
    NO_DEFAULT_PATH
)

find_path(
    7Z_INTERFACE_INCLUDE_PATH
    IDecl.h
    PATHS
        "${CMAKE_CURRENT_LIST_DIR}/CPP/7zip"
    NO_DEFAULT_PATH
)

find_path(
    7Z_ARCHIVE_INCLUDE_PATH
    IArchive.h
    PATHS
        "${CMAKE_CURRENT_LIST_DIR}/CPP/7zip/Archive"
    NO_DEFAULT_PATH
)

find_path(
    7Z_BINARIES_PATH
    NAMES
        7z.dll
        7z.lib
        7z.pdb
        7zd.dll
        7zd.lib
        7zd.pdb
    PATHS
        "${CMAKE_CURRENT_LIST_DIR}/CPP/7zip/Bundles/Format7zF/bin/"
    NO_DEFAULT_PATH
)

if(TARGET 7z::library)
    return()
endif()

add_library(
    7z::library
    SHARED
    IMPORTED
)

define_property(
    TARGET
    PROPERTY
        PropVariant_Path
    BRIEF_DOCS
        "Path to PropVariant.cpp"
    FULL_DOCS
        "Path to PropVariant.cpp"
)

set_target_properties(
    7z::library
    PROPERTIES
        IMPORTED_LOCATION
            "${7Z_BINARIES_PATH}/7z.dll"
        IMPORTED_LOCATION_DEBUG
            "${7Z_BINARIES_PATH}/7zd.dll"
        IMPORTED_IMPLIB
            "${7Z_BINARIES_PATH}/7z.lib"
        IMPORTED_IMPLIB_DEBUG
            "${7Z_BINARIES_PATH}/7zd.lib"
        INTERFACE_INCLUDE_DIRECTORIES
            "${7Z_COMMON_INCLUDE_PATH};${7Z_WINDOWS_INCLUDE_PATH};${7Z_INTERFACE_INCLUDE_PATH};${7Z_ARCHIVE_INCLUDE_PATH}"
        PropVariant_Path
            "${7Z_WINDOWS_INCLUDE_PATH}/PropVariant.cpp"
)

set(
    COMPONENT_NAMES

    CNPM_RUNTIME_7z
    CNPM_RUNTIME
)

foreach(COMPONENT_NAME ${COMPONENT_NAMES})
    install(
        FILES
            $<TARGET_FILE:7z::library>
        DESTINATION
            .
        COMPONENT
            ${COMPONENT_NAME}
        EXCLUDE_FROM_ALL
    )
endforeach()
