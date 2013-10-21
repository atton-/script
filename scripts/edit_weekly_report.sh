#!/bin/sh
# edit weekly report script.
#
# command line arguments
#   1: diff of weeks
#     example, -1 is before week, +1 is next week

vim "`weekly_date_range.rb $1`.txt"
