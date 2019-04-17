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

list ( APPEND C_SOURCES src/BallObject.m )
list ( APPEND C_SOURCES src/Game.m )
list ( APPEND C_SOURCES src/GameLevel.m )
list ( APPEND C_SOURCES src/GameObject.m )
list ( APPEND C_SOURCES src/ParticleGenerator.m )
list ( APPEND C_SOURCES src/ResourceManager.m )
list ( APPEND C_SOURCES src/Shader.m )
list ( APPEND C_SOURCES src/Texture2D.m )
list ( APPEND C_SOURCES src/SpriteRenderer.m )
list ( APPEND C_SOURCES src/main.m )
list ( APPEND C_SOURCES src/stb.c )
#
#   application includes
#
set ( INCLUDES "${INCLUDES};/usr/include" )
set ( INCLUDES "${INCLUDES};./vendor" )
set ( INCLUDES "${INCLUDES};./include" )


#
#   compiler options
#
# Libs: 
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lm" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lobjfw" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lobjfw_rt" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ldl" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lpthread" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lglfw" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lGLEW" )
set ( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -lOpenGL" )



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

target_link_libraries ( ${PROJECT_NAME} m objfw objfw_rt dl pthread glfw GLEW OpenGL  )
install (TARGETS ${PROJECT_NAME} RUNTIME DESTINATION . )

include (CPack)

# (generated from template: objc. Do not modify. )
