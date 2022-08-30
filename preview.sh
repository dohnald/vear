DIR="$HOME/vear"
RESULT=$(echo $1 | awk -F '|' '{print $NF}')
echo "$($DIR/lib/xcall.app/Contents/MacOS/xcall -url "bear://x-callback-url/open-note?open_note=no&show_window=no&id=$RESULT" | jq -r '.note')"
