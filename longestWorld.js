/*
Problem
Have the function LongestWord(sen) take the sen parameter being passed and return the longest word in the string. If there are two or more words that are the same length, return the first word from the string with that length. Ignore punctuation and assume sen will not be empty. Words may also contain numbers, for example "Hello world123 567"
 */

const longestWorld = (sen) => {
    const re = new RegExp(/\w$/);
    let max = 0;

    sen.split(' ').map((element) => {
        if(element.length <= max) {
            return;
        }

        if(re.test(element)) {
            max = element.length;
            sen = element;
        }
    });

    return sen;
}

console.log(longestWorld("fun&!! time"));

console.log(longestWorld("I love dogs"));