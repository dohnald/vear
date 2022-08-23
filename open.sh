DIR="$HOME/vear"
TOKEN=`cat $DIR/.token`
if [ $# -eq 0 ]
  then
    RESULT=$($DIR/lib/xcall.app/Contents/MacOS/xcall -url "bear://x-callback-url/search?token=$TOKEN&show_window=no" -activateApp NO | jq -r ".notes" | jq -r ".[] | .title+\"|\"+.identifier" | fzf | awk -F '|' '{print $NF}')
else
    RESULT=$1
fi
echo $RESULT
$DIR/lib/xcall.app/Contents/MacOS/xcall -url "bear://x-callback-url/open-note?open_note=no&show_window=no&id=$RESULT" | jq -r '.note' > $DIR/$RESULT.md
nvim $DIR/$RESULT.md
