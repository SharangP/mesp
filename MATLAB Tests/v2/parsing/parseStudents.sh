#!/bin/sh

# load the dictionary of courses with exams
# parse the student/course list and print a dictionary in the format:
# [student_id course_name1 course_name2 ...]

gawk '
BEGIN {

student = 0

# add special cases to the dictionary here

}

{
    # process the dictionary - load it into memory
    if(FILENAME == ARGV[1] && NR != 1){
        if($4 ~ /\//){
            split($4,slash,"/")

            # sections (like A/B or 120/121A etc)
            # THIS COULD MESS UP FOR CERTAIN CASES IN THE FUTURE
            if(length(slash[2]) < 5){
                # two cases...

                len = length(slash[1]) - length(slash[2])
                if(length(slash[2]) > 2) {
                    len++
                    section = slash[1] substr(slash[2],length(slash[2]),1);
                }
                else{
                    section = slash[1];
                }

                courses[section] = $1;
                #found[section] = 1;
                print section;
                
                section = substr(slash[1],1,len) slash[2];
                courses[section] = $1;
                #found[section] = 1;
                print section;
            }
            else if(length(slash[1]) < 4){

                # cases like "ME/EID458"

                section = slash[2]
                courses[section] = $1;
                #found[section] = 1;
                print section;
                
                section = slash[1] substr(slash[2],length(slash[2])-2,3);
                courses[section] = $1;
                #found[section] = 1;
                print section;
            } 
            else {
                courses[$4] = $1;
                #found[$4] = 1;
            }
        }
        else{
            courses[$4] = $1;
            #found[$4] = 1;
        }
    }

    # process the student course list, match against dictionary
    else if(FILENAME == ARGV[2]){

        C = ++student;

        for(i = 2; i <= NF; i++){

            thisCourse = "";
            split($i,name,"-")
            
            if(name[3] !=1){
                thisCourse = name[1] name[2] name[3];
            }
            else{
                thisCourse = name[1] name[2];
            }

            # course name exceptions from student list
            if(thisCourse ~ /PH112L/) {thisCourse = "PH112";}
            if(name[1] name[2] == "PH214L") {thisCourse = "PH214";}

            if(courses[thisCourse]){
                #found[thisCourse] = 0;       

                #print out parsed schedule
                #print out course ids
                #C = C " " courses[thisCourse];
    
                #or print out course names
                C = C " " thisCourse;
            }

        }
        print C;
    }
}
' parsed.txt spring2013.csv
