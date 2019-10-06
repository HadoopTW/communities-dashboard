#!/bin/bash
export FB_EMAIL=""
export FB_PASS=""
python HadoopTWFBMembers.py 
python parse_hadoop-tw_fb_members.py
cat hadoop-tw.csv | sed 's#.*member_id=#hadoop-tw;#' | sed 's#\&.*by #;#' | sed 's#\&.* about #;;#' | sed 's# on #;#' > hadoop-tw.member.csv
