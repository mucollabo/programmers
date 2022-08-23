const solution = (n) => {
    const nums = [1, 2, 3];
    let sum = 0;
    let cnt = 0;
    for (let num in nums) {
        for (let o in nums) {
            sum = nums[num] + nums[o];
            if (sum === n) {
                cnt++;
            }
        }
    }
    return cnt;
}

console.log(solution(4));
