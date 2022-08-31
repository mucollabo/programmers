/*
정수 1, 2, 3 을 사용하여 합으로 4을 만들 수 있는 경우의 수는 7이다.
예)
1 + 1 + 1 + 1
1 + 1 + 2
1 + 2 + 1
2 + 1 + 1
2 + 2
3 + 1
1 + 3

정수 n 을 만들 수 있는 경우의 수를 구하라.
단, n은 11보다 작은 양의 정수이다.

n = 1
1
cnt = 1

n = 2
1 + 1
2
cnt = 2

n = 3
1 + 1 + 1
1 + 2
2 + 1
3
cnt = 4

n = 4
1 + 1 + 1 + 1
1 + 1 + 2
1 + 2 + 1
2 + 1 + 1
2 + 2
3 + 1
1 + 3
cnt = 7

 */

const solution = (n) => {
    let sum = 0;
    if(n === 1) {
        return 1;
    } else if(n === 2) {
        return 2;
    } else if(n === 3) {
        return 4;
    } else {
        sum = solution(n-1) + solution(n-2) + solution(n-3);
    }
    return sum;
}

console.log(solution(1));
console.log(solution(2));
console.log(solution(3));
console.log(solution(4));
console.log(solution(5));
console.log(solution(6));
console.log(solution(7));
console.log(solution(8));
console.log(solution(9));
console.log(solution(10));
