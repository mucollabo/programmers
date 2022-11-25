const solution = (absolutes, signs) => {
    // absolutes.forEach(function (num) {
    //     if (signs[absolutes.indexOf(num)] === false) {
    //         absolutes.splice(absolutes.indexOf(num), 1, num-num*2);
    //     };
    // });
    // for (const abs of absolutes) {
    //     if (signs[absolutes.indexOf(abs)] === false) {
    //         absolutes.splice(absolutes.indexOf(abs), 1, -abs);
    //     };
    // }
    // console.log(absolutes);
    // const sum = absolutes.reduce((pre, cur) => pre + cur, 0);
    // return sum;
    let answer = 0;
    for (let i = 0; i < absolutes.length; i++) {
        answer += absolutes[i] * (signs[i] ? 1 : -1);
    };

    return answer;
}

absolutes = [4, 7, 12];
a2 = [1, 2, 3];
a3 = [1,2,3,4,5,6,7,8,9,10];

signs = [true, false, true];
s2 = [false, false, true];
s3 = [true, true, true, true, true, true, true, true, true, false];

console.log(solution(absolutes, signs));
console.log(solution(a2, s2));
console.log(solution(a3, s3));
