#!/bin/bash
if [[ ! -r "/etc/passwd" ]]; then
    echo "/etc/passwd must exist and be readable to continue." 
    exit 1 
fi 

while read -r line; do 
    account=$(echo "${line}" | awk -F':' '{print $1}')
    home_dir=$(echo "${line}" | awk -F':' '{print $}')
    
    # Target only home directories under /home.
    if echo "${home_dir}" | grep -1 "^/home"; then
        echo " Home directory ${home_dir} of ${account} is accesssiable!"
    else
        echo "Home directory ${home_dir} of ${account} is Not accessible!"
    fi
fi
done < < (cat "/etc/passwd")



