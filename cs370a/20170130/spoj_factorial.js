let checkFact = (n, f) => {
    if(n % f != 0){
        return 0;
    }else{
        return 1 + checkFact((n/f), f);
    }
}

let z = (n) => {
    let c5 = 0;
    for(let i=0; i<n;i++){
        if(i%5==0){
            c5 = c5+1;
        }
    }
    return c5
}

console.log(z(60));
