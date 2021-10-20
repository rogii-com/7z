cmake_minimum_required(VERSION 3.12.0)

project(7z)

set(
    ROGII_FOLDER_PATH
    "${CMAKE_CURRENT_LIST_DIR}/rogii"
)
include(${ROGII_FOLDER_PATH}/npm/Include.cmake)
include(${ROGII_FOLDER_PATH}/environment.cmake)
 
CNPM_PREPARE_PACKAGES(
    DEFAULT_REPOSITORY_URLS
    "$ENV{CNPM_URLS}"
)

set(UPPER_CPU)
string(TOUPPER ${ARCH} UPPER_CPU)
set(ENV{CPU} ${UPPER_CPU})


if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(ENV{7Z_DEBUG} 1)
    set(DEBUG_PREFIX "d")
endif()

set(
    FormatPath
    "${PROJECT_SOURCE_DIR}/CPP/7zip/Bundles/Format7zF"
)

execute_process(
    COMMAND
        nmake   
    WORKING_DIRECTORY
        "${FormatPath}"
    )

file(
    MAKE_DIRECTORY
    "${FormatPath}/bin"
)


file(GLOB 7Z_BIN
"${FormatPath}/${UPPER_CPU}/7z${DEBUG_PREFIX}.*"
) 

file(
    COPY
        ${7Z_BIN}
    DESTINATION
        "${FormatPath}/bin/"
)

file(
    REMOVE_RECURSE
    "${FormatPath}/${UPPER_CPU}/"
)

file(GLOB VC_PDB
    "${FormatPath}/vc*.pdb"
) 

file(REMOVE ${VC_PDB})

file(
    COPY 
        "${CMAKE_CURRENT_LIST_DIR}/Asm" 
        "${CMAKE_CURRENT_LIST_DIR}/C" 
        "${CMAKE_CURRENT_LIST_DIR}/CPP" 
        "${CMAKE_CURRENT_LIST_DIR}/DOC" 
    DESTINATION 
    ${CMAKE_INSTALL_PREFIX}
)

file(
    REMOVE_RECURSE
    "${FormatPath}/bin/"
)