#!/usr/bin/env bash

# Config vars
MAIN=hello/Main.scala
PACKAGE_MAIN=hello.Main
XBT_DIR=.xbt
OUT_DIR=${XBT_DIR}/target


__compile() {
    echo "Compiling..."
    mkdir -p ${OUT_DIR}
    # scalac ${MAIN} -d ${OUT_DIR}
    scalac ./hello/**/*.scala -d ${OUT_DIR}
    return 0
}

__run() {
    __compile
    echo "Running..."
    scala -classpath ${OUT_DIR} ${PACKAGE_MAIN}
    return 0
}

__test() {
    echo "Test"
    return 0
}

__clean() {
    rm -rf ${OUT_DIR}
    return 0
}

__usage() {
    echo "XBT, the x build tool. Because sbt and cbt suck."
    echo "Usage: xbt <command> [<flags>]*"
    echo "  Available commands:"
    echo "    run"
    echo "    test"
    echo "    compile"
    return 0
}

__main() {
    local CMD="$1"
    shift
    case "${CMD}" in
        compile)    __compile   $* ;;
        run)        __run       $* ;;
        test)       __test      $* ;;
        clean)      __clean ;;
        *)          __usage ;;
    esac
}

__main $*
