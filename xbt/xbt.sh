#!/usr/bin/env bash

# Config vars
MAIN=hello/Main.scala
PACKAGE_MAIN=hello.Main
XBT_DIR=.xbt
OUT_DIR=${XBT_DIR}/target
RESOLVERS=https://search.maven.org/solrsearch/select


__compile() {
    echo "Compiling..."
    mkdir -p ${OUT_DIR}
    # scalac ${MAIN} -d ${OUT_DIR}
    local files=$(find . -name \*.scala -not -path ${XBT_DIR})
    echo "Files found: ${files}"
    scalac ${files} -d ${OUT_DIR}
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

__search() {
    if [[ ! -n "$1" ]]; then
        echo "No search parameter supplied to command 'search'"
        return 1
    fi

    local resultType=json
    local searchMax=20
    local searchString=$1
    shift

    for resolver in ${RESOLVERS}; do
        local params="q=${searchString}&rows=${searchMax}&wt=${resultType}"
        local url="${resolver}?${params}"
        echo "Querying ${url}"
        curl -X GET ${url}
    done
    return 0
}

__clean() {
    rm -rf ${OUT_DIR}
    return 0
}

__usage() {
    echo "XBT, the x build tool. Because sbt and cbt suck."
    echo "Usage: xbt [command] [flags]*"
    echo "  Where [command] is one of: "
    echo "    run, test, compile, clean, search"
    return 0
}

__main() {
    local CMD="$1"
    shift
    case "${CMD}" in
        compile)    __compile   $* ;;
        run)        __run       $* ;;
        test)       __test      $* ;;
        search)     __search    $* ;;
        clean)      __clean     $* ;;
        *)          __usage     $* ;;
    esac
}

__main $*
