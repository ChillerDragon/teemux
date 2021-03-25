#!/bin/bash

function log() {
	printf '[*] %s\n' "$1"
}
function wrn() {
	printf '[!] %s\n' "$1"
}
function err() {
	printf '[-] %s\n' "$1"
}

log "onshutdown.sh"

function archive_gmon() {
    mkdir -p logs/{gmon,gprof}
    local dst
    local ts
    ts="$(date '+%F_%H-%M')"
    if [ -f gmon.out ]
    then
        if [ ! -x "$(command -v gprof2dot)" ] || [ ! -x "$(command -v dot)" ]
        then
            wrn "missing dependency $(tput bold)gprof2dot$(tput sgr0) and $(tput bold)dot$(tput sgr0)"
            wrn "skipping callgraph generation..."
        else
            log "generating gprof callgraph ..."
	    gprof "$(command -v chillerbot-ux)" | gprof2dot | dot -Tsvg -o gprof.svg
        fi
        dst=logs/gmon/gmon_"$ts".out
        log "archiving $dst ..."
        mv gmon.out "$dst"
    fi
    if [ -f gprof.svg ]
    then
        dst=logs/gprof/gprof_"$ts".svg
        log "archiving $dst ..."
        mv gprof.svg "$dst"
	tput bold
	echo ""
	echo "  ${BROWSER:-firefox} $dst"
	echo ""
	tput sgr0
    fi
}

archive_gmon

