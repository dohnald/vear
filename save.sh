DIR="$HOME/vear"
TOKEN=`cat $DIR/.token`
TEXT=`cat $DIR/$1.md | jq -sRr @uri`
NOW=`date +%Y-%m-%dT%H%M%S`
$DIR/lib/xcall.app/Contents/MacOS/xcall -url "bear://x-callback-url/add-text?token=$TOKEN&mode=replace_all&text=$TEXT&id=$1" -activateApp NO > /dev/null
