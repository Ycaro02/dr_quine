#!/bin/bash
# first
# second
Colleen(){
s='#!/bin/bash\12# first\12# second\12Colleen(){\12s=\47%s\47\12printf "$s" "$s"\12}\12Colleen\12'
printf "$s" "$s"
}
Colleen
