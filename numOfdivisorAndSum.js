/*
약수의 개수와 덧셈
문제 설명
두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.

제안 사항
-1 ≤ left ≤ right ≤ 1,000

입출력 예
left	right	result
13	    17	    43
24	    27	    52

 */

const solution = (left, right) => {
    let sum = 0;
    const divisors = Array.from({length:right-left+1}, (_, index) => index + left);

    divisors.forEach((value) => {
        let cnt = 1;
        for (let i = 0; i <= value/2; i++) {
            if (value % i === 0) cnt += 1;
        };
        if (cnt % 2 === 0) {
            sum += value;
        } else sum += -value;
    });
    return sum;
}


console.log(solution(24, 27));

