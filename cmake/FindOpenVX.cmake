ocv_clear_vars(HAVE_OPENVX OPENVX_LIBS)

set(OPENVX_ROOT "" CACHE PATH "OpenVX install directory")

if(OPENVX_ROOT)
  find_path(OPENVX_INCLUDE_DIR "VX/vx.h" PATHS "${OPENVX_ROOT}/include" DOC "OpenVX include path")
  find_library(OPENVX_openvx_LIB "openvx" PATHS "${OPENVX_ROOT}/lib")
  find_library(OPENVX_vxu_LIB "vxu" PATHS "${OPENVX_ROOT}/lib")
  set(OPENVX_LIBRARIES "${OPENVX_openvx_LIB}" "${OPENVX_vxu_LIB}" CACHE STRING "OpenVX libraries")
  if (OPENVX_INCLUDE_DIR AND OPENVX_LIBRARIES)
    set(HAVE_OPENVX TRUE)
  endif()
endif()

if(NOT HAVE_OPENVX)
  unset(OPENVX_LIBRARIES CACHE)
  unset(OPENVX_INCLUDE_DIR CACHE)
  unset(HAVE_OPENVX)
  message(STATUS "OpenVX: OFF")
endif()
