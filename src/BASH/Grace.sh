no_main='#!/bin/bash'
# Comment
grace='no_main=\47#!/bin/bash\47\12# Comment\12grace=\47%s\47\12start=\47printf "$grace" "$grace" > "Grace_kid.sh"\47\12eval $start\12'
start='printf "$grace" "$grace" > "Grace_kid.sh"'
eval $start
