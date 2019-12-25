# for file in $(ls *.2019-11-25.*.log); do new_file=${file##*JDK_APP_API_}; new_file=${new_file/]}; mv ${file} ${new_file}; done

for file in $(ls *ESG_BDUS_CORE_CNSZ17_JDK_APP_API_*.log); do new_file=$(echo $file | sed -r 's/.*_([0-9]{1,3}.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})\]_(access_info\.[0-9]{4}\-[0-9]{2}\-[0-9]{2})\.([0-9]+\.log)/\2_\1_\3/g'); mv ${file} ${new_file}; done