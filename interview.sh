#!/bin/bash

 
# Select interview questions and rate candidates
# Author: Helen Gu 

 

cd `dirname $0`

STRATEGY=$1

INTERVIEWTYPE=$(echo $STRATEGY | cut -d\. -f1)

REPORT="`date +%Y%m%d%H%m%S`.$INTERVIEWTYPE.interviewReport.txt"

 

SCORESYSTEM="5 - Exceeds Requirements;

4 - Meets and Exceeds some Requirements;

3 - Meets Requirements;

2 - Meets some Requirements;

1 - Does not Meet Requirements;"

 

echo "# ------------------------------------------------------------------------------"

echo "# Starting a $INTERVIEWTYPE interview..."

echo "# ------------------------------------------------------------------------------"

echo "# Greet the applicant and introduce yourself and your role within the organization."

echo "# Put the applicant at ease; offer him/her a glass of water if applicable."

echo "# Please enter participants in the interview - "

read names

echo "WHEN IS THE INTERVIEW HELD?

`date +%Y%m%d%H`

WHO IS IN THE INTERVIEW MEETING?

`echo $names`

INTERVIEW SCORE SYSTEM:

`echo $SCORESYSTEM`

QUESTION | SCORE ( 1 to 5) | COMMENTS" >> $REPORT

 

function askquestions {

    echo "# Type of Question can be selected -"   
    
    grep "^[0-9]\. " $STRATEGY | sed 's/$/\n\n/g'

    echo -n "# Please select a type of question (digit only): "

    read type

    echo "# Question can be selected - "

    grep "^$type".[1-9] $STRATEGY | sed 's/$/\n\n/g'

    echo -n "# Please select a question (type [1-9].[1-9]) or enter your question: "

    read question

    # insert a question into $STRATEGY

    if [ -z `echo $question | grep ^[1-9]` ]; then

        pattern=$(grep ^$type $STRATEGY | tail -1 | cut -d" " -f1)

        numq=$type.$(expr $(echo $pattern | cut -d\. -f2) + 1)

        echo $numq

        question=${numq}" "${question}

        sed -i.bak "/$pattern/ a $question" $STRATEGY

    fi

    # Comment for the answer of interviewer

    echo "Enter your comment for the answer of interviewer - "

    read comment

    echo $SCORESYSTEM

    echo -n "Enter the score of the answer of this question( n of 5):"

    read score

    # writing interview report

    echo `grep "$question" $STRATEGY`" | $score / 5 | $comment"  >> $REPORT

}

 

while true; do

    askquestions

    echo -n "Enter to continue for the next question and Control-C to exit! "

    read

    echo "############################################################################"

    echo "#################### Starting a New Question ###############################"

    echo "############################################################################"

done