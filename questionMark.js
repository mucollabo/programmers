/*
Problem
coderbyte: Questions Marks
Have the function QuestionsMarks(str) take the str string parameter, which will contain single digit numbers, letters, and question marks, and check if there are exactly 3 question marks between every pair of two numbers that add up to 10. If so, then your program should return the string true, otherwise it should return the string false. If there aren't any two numbers that add up to 10 in the string, then your program should return false as well.

For example: if str is "arrb6???4xxbl5???eee5" then your program should return true because there are exactly 3 question marks between 6 and 4, and 3 question marks between 5 and 5 at the end of the string.

 */

const questionMark = (str) => {
    const split_str = str.split(/[0-9]/);
    const numArr = [];
    let numIndex = -1;
    split_str.map((element) => {
        numIndex += element.length + 1;

        if(str[numIndex]) {
            numArr.push(+str[numIndex]);
        }
    })
    console.log(split_str, numArr);

    for(let i = 0; i < split_str.length; i++) {
        if((split_str[i].split('?').length - 1) >= 3) {
            if (numArr[i-1] + numArr[i] === 10) {
                return true;
            }
        }
    }
    return false;
}

console.log(questionMark("acc?7??sss?3rr1??????5"));
console.log(questionMark("aa6?9"));
console.log(questionMark("arrb6???4xxbl5???eee5"));
