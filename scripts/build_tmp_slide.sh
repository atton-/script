#!/bin/sh

work_dir='/tmp/tmp_slide'
src_filename="$1.md"
slide_path="${work_dir}/$2.html"

if [ $# -ne 2 ]; then
    echo "Usage: build_tmp_slide.sh <src_path> <src_name_without_modifier>"
    echo "Note: this script usually called by quickrun"
    exit
fi

mkdir -p ${work_dir}

if !(which slideshow >& /dev/null) then
    echo 'slideshow not found'
    exit
fi

slideshow build $src_filename -o /tmp/tmp_slide

if [[  $(uname) == Darwin ]]; then
    open $slide_path
fi
