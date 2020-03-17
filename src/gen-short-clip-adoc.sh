#!/bin/bash

STRENGTHS="10 15 20 30"
STR_CLIPS="5 10 15 20 25 30"
MAIN_CLIPS="5 10 15 20 30 40 50 60"

echo ".sync-codec-resistence$TRUNC"
echo '[frame="topbot",options="header",cols="<2,8*>1"]'
echo '|=========================='
echo -n "| "
for CLIP in $MAIN_CLIPS
do
  echo -n "| $CLIP"
done
echo

for TEST in mp3-256 mp3-128 double-mp3-128 ogg-128
do
  echo -n "| $TEST "
  for CLIP in $MAIN_CLIPS
  do
    cat main-$TEST-*-$CLIP | awk '{bad += $1; n += $2} END {if (n==0) n=1;fer=100.0*bad/n; bold=fer>0?"*":" ";printf ("| %s%.2f%s", bold, fer, bold)}'
  done
  echo
done
echo
echo '|=========================='

echo ".sync-codec-resistence$TRUNC"
echo '[frame="topbot",options="header",cols="<2,6*>1"]'
echo '|=========================='
echo -n "| "
for CLIP in $STR_CLIPS
do
  echo -n "| $CLIP"
done
echo

for STRENGTH in $STRENGTHS
do
  echo -n "| $STRENGTH "
  for CLIP in $STR_CLIPS
  do
    cat str-$STRENGTH-mp3-*-$CLIP | awk '{bad += $1; n += $2} END {if (n==0) n=1;fer=100.0*bad/n; bold=fer>0?"*":" ";printf ("| %s%.2f%s", bold, fer, bold)}'
  done
  echo
done
echo
echo '|=========================='
