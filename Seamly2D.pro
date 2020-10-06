include(common.pri)

message("Entering Seamly2D.pro")

#These checks need because we can quote all paths that contain space.

LIST = $$split(PWD,' ')
count(LIST, 1, >): error("The build will fail. Path '$${PWD}' contains space!!!")

LIST = $$split(OUT_PWD,' ')
count(LIST, 1, >): error("The build will fail. Path '$${OUT_PWD}' contains space!!!")

unix {
    *g++* {
        GCC_VERSION = $$system("g++ -dumpversion")
        contains(GCC_VERSION, ^9.*$) {
            message( "Seamly2D.pro: g++ version 9.x found" )
            CONFIG += g++9
        } else {
            contains(GCC_VERSION, ^8.*$) {
                message( "Seamly2D.pro: g++ version 8.x found" )
                CONFIG += g++8
            } else {
                contains(GCC_VERSION, ^7.*$) {
                    message( "Seamly2D.pro: g++ version 7.x found" )
                    CONFIG += g++7
                } else {
                    contains(GCC_VERSION, ^6.*$) {
                        message( "Seamly2D.pro: g++ version 6.x found" )
                        CONFIG += g++6
                    } else {
                        message( "Seamly2D.pro: Unknown GCC configuration" )    
                    }
                }
            }
        }
    }
}
TEMPLATE = subdirs
SUBDIRS = src
