cmake_minimum_required ( VERSION 3.1 )
###################################################################################
#
#   Build testobjfw
#
###################################################################################
project ( testobjfw VERSION 0.0.1 )

#
set ( VERSION 0.0.1 )
set ( RELEASE_NAME testobjfw )

#
# enable features
#
include ( CMakeToolsHelpers OPTIONAL )

#
#   libraries - sources & packages
#
if (EXISTS ${CMAKE_SOURCE_DIR}/data AND NOT DEFINED ZEROG )
    add_subdirectory (data)
    list ( APPEND RESOURCES ${resources_gresource_xml_C_FILE} )
endif ()

#
#   application source
#

list ( APPEND C_SOURCES src/lines.m )
list ( APPEND C_SOURCES src/ObjCairo/ObjCairoContext.m )
list ( APPEND C_SOURCES src/ObjGtk/ObjGtk.m )
list ( APPEND C_SOURCES src/ObjGtk/ObjGtkDrawingArea.m )
list ( APPEND C_SOURCES src/ObjGtk/ObjGtkWindow.m )
#
#   application includes
#
set ( INCLUDES "${INCLUDES};/usr/include/pango-1.0" )
set ( INCLUDES "${INCLUDES};/usr/include/cairo" )
set ( INCLUDES "${INCLUDES};/usr/include/gtk-3.0" )
set ( INCLUDES "${INCLUDES};/usr/include/gdk-pixbuf-2.0" )
set ( INCLUDES "${INCLUDES};/usr/include/atk-1.0" )
set ( INCLUDES "${INCLUDES};/usr/lib/glib-2.0/include" )
set ( INCLUDES "${INCLUDES};/usr/include" )
set ( INCLUDES "${INCLUDES};/usr/include/glib-2.0" )


#
#   compiler options
#
# Libs: 
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lm" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lobjfw" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lobjfw_rt" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ldl" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lpthread" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lgio-2.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lglib-2.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lgobject-2.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lpango-1.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lcairo" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lgdk_pixbuf-2.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -latk-1.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lgtk-3" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lgdk-3" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lpangocairo-1.0" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lcairo-gobject" )



set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fexceptions" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fobjc-exceptions" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -funwind-tables" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fconstant-string-class=OFConstantString" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Xclang -fno-constant-cfstrings" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Xclang -fobjc-runtime=objfw" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Xclang -fblocks" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -DPIC" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -L/usr/local/lib" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -w -std=c99 -O3" )

# definitions 

include_directories(AFTER ${INCLUDES})

#
#   compile ccode & link executable
#
add_executable ( ${PROJECT_NAME} ${C_SOURCES} ${RESOURCES} )

target_link_libraries ( ${PROJECT_NAME} m objfw objfw_rt dl pthread gio-2.0 glib-2.0 gobject-2.0 pango-1.0 cairo gdk_pixbuf-2.0 atk-1.0 gtk-3 gdk-3 pangocairo-1.0 cairo-gobject  )
install (TARGETS ${PROJECT_NAME} RUNTIME DESTINATION . )

include (CPack)

# (generated from template: objc. Do not modify. )
