let isPandigital = (n) => {
    let n_char_arr = n.toString().split('');
    //check for duplicate digits
    if(new Set(n_char_arr).size !== n_char_arr.length){
        return false;
    }
    //sum up digits
    let n_digit_sum = n_char_arr.reduce(
        (a, b) => {
            return parseInt(a)+parseInt(b);
        }
    )
    //get length of number
    let n_len = n.toString().length;
    //see if len(n) == sum(1...n)
    return n_digit_sum == (n_len*(n_len+1))/2;
}

let n=1, goodProds = [];
let eqnStr = (`${n}${m}${n*m}`);
let withinLengthRange = (`${n}${m}${n*m}`).length < 10;
while(withinLengthRange){
    //while(withinLengthRange){
    for(let m=1; `${n}${m}${n*m}`).length < 10, m++){
        eqnStr = parseInt((`${n}${m}${n*m}`));
        if(isPandigital(eqnStr)){
            let prod = (m*n);
            if(!goodProds.includes(prod)){
                //console.log(eqnStr);
                goodProds.push(prod)
            }
        }
        withinLengthRange = (`${n}${m}${n*m}`).length < 10;
    }
    n=n+1;
    withinLengthRange = ((n*m).toString() + n.toString() + m.toString()).length < 10;
}

console.log(
    goodProds,
    goodProds.reduce(
        (a, b)=>{return a+b},
        0
    )
);


console.log(isPandigital(56784321))
console.log(isPandigital(4341))
