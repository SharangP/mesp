#!/bin/sh

# parse the student/course list and print a dictionary in the format:
# [student_id course_name1 course_name2 ...]

gawk '
BEGIN {

exam_id = 0

}

{
    if(NF !=1){
        for(i = 2; i < NF; i++){
            ++exams[$i]
        }
#        if(!exam[slots[$4,$5],$6]) exam[slots[$4,$5],$6] = ++exam_id
#        print exam[slots[$4,$5],$6],slots[$4,$5],$6,$2
        }
}

END {
    print NR
    for(i in exams){print i, exams[i]}
}
' spring2013.csv
