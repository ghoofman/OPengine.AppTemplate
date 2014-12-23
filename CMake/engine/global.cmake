
SET(OPIFEX_OS_WIN32 "${OPIFEX_OS}" STREQUAL "OPIFEX_WIN32")
SET(OPIFEX_OS_WIN64 "${OPIFEX_OS}" STREQUAL "OPIFEX_WIN64")
SET(OPIFEX_OS_OSX32 "${OPIFEX_OS}" STREQUAL "OPIFEX_OSX32")
SET(OPIFEX_OS_OSX64 "${OPIFEX_OS}" STREQUAL "OPIFEX_OSX64")
SET(OPIFEX_OS_LINUX32 "${OPIFEX_OS}" STREQUAL "OPIFEX_LINUX32")
SET(OPIFEX_OS_LINUX64 "${OPIFEX_OS}" STREQUAL "OPIFEX_LINUX64")
SET(OPIFEX_OS_ANDROID "${OPIFEX_OS}" STREQUAL "OPIFEX_ANDROID")

OPIFEX_EVAL(OPIFEX_OS_WINDOWS ${OPIFEX_OS_WIN32} OR ${OPIFEX_OS_WIN64})
OPIFEX_EVAL(OPIFEX_OS_UNIX ${OPIFEX_OS_OSX32} OR ${OPIFEX_OS_OSX64} OR ${OPIFEX_OS_LINUX32} OR ${OPIFEX_OS_LINUX64})

SET(OPIFEX_OS_32 ${OPIFEX_OS_WIN32} OR ${OPIFEX_OS_OSX32} OR ${OPIFEX_OS_LINUX32} OR ${OPIFEX_OS_ANDROID})
SET(OPIFEX_OS_64 ${OPIFEX_OS_WIN64} OR ${OPIFEX_OS_OSX64} OR ${OPIFEX_OS_LINUX64})

# Make sure the XInput library is linked correctly (Regardless of which Visual Studio is used)
# Windows 7 - http://en.wikipedia.org/wiki/Windows_NT#Releases
# MSVC10 - Visual Studio 2010
if( ${CMAKE_SYSTEM} STREQUAL "Windows-6.1" )
	if(${MSVC_VERSION} GREATER 1600)
		SET(MSVC_WIN7_FIX 1)
	endif()
endif()