#!/bin/sh

# parse the final schedule and print a dictionary in the format:
# [class_name,exam_slot]

gawk '
BEGIN {

# define dictionary of exam slots
    slots["5/9","10-1"] = 1
    slots["5/9","2-5"] = 2
    slots["5/9","6-9"] = 3

    slots["5/10","10-1"] = 4
    slots["5/10","2-5"] = 5
    slots["5/10","6-9"] = 6

    slots["5/13","10-1"] = 7
    slots["5/13","2-5"] = 8
    slots["5/13","6-9"] = 9

    slots["5/14","10-1"] = 10
    slots["5/14","2-5"] = 11
    slots["5/14","6-9"] = 12

    slots["5/15","10-1"] = 13
    slots["5/15","2-5"] = 14
    slots["5/15","6-9"] = 15

# some "HTA" classes have wierd exam times, just push them into a slot
    slots["5/14","3-5"] = 11
    slots["5/10","10-12"] = 4
    slots["5/9","3-5"] = 2
    slots["5/15","3-5"] = 14
    slots["5/15","6-8"] = 15
    slots["5/9","10-12"] = 1
    slots["5/9","6-8"] = 3
}
{
    if($4){
        # put special cases here
        print $2,slots[$4,$5],$6
        }
}
' good_final_schedule.txt
