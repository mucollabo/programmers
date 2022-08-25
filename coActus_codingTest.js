const solution = (n) => {
    const nums = [3, 2, 1];
    let sum = 0;
    let cnt = 0;
    for (let num in nums) {
        for (let i=1; i<n; i++) {
            sum = nums[num] + nums[i];
            if (sum === n) {
                cnt++;
            }
        }
    }
    return cnt;
}

console.log(solution(4));
