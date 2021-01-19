# interview-rating-helper

a shell script that allow interviewers to select questions, rate candidates and give out comments

## Description

Infrastructure as code, Pipeline as code ... What about interview as code?

## Interview Score System:

    -   5 - Exceeds Requirements;
    -   4 - Meets and Exceeds some Requirements;
    -   3 - Meets Requirements;
    -   2 - Meets some Requirements;
    -   1 - Does not Meet Requirements;"

## Guiding Principles when assessing candidates:

    - Deliver Legendary Customer Experience

    - Be an Extraordinary Place to Work

    - Operate with Excellence

    - Understand Our Business

    - Take Only Risks We Understand and Can Manage

    - Increase Shareholder Value

## Usage

Prepare interview question file like screening.txt or 2ndround.txt

    - Add a type of question like [1-9]. | Tips for interviewer.

    - Add a question like [1-9].[1-9] .

    - New Question entered in an interview will be added automatically.

Run the script with question file.

Script will prompt you to select type of question, question, comment for question and score for a question.

    - screening interview:

./interview.sh screening.txt

    - 2nd round interview:

./interview.sh 2ndround.txt



