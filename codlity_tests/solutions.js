// you can write to stdout for debugging purposes, e.g.
// console.log('this is a debug message');
let meta = []
function solution(A) {
    // write your code in JavaScript (Node.js 8.9.4)
    let istCityIndex = 0
    for (let ist of A) {

        let secondCityIndex = 0;
        for (let second of A) {

            meta.push(ist + second + (secondCityIndex - istCityIndex))
            secondCityIndex++
        }
        istCityIndex++
    }

    return Math.max(...meta);
}

function senatnces (str){
    let sentannces = str.replace(/[.?!]/g, "|").split("|")
    const lengths = sentannces.map((sentance)=>{
        return sentance.split(' ').filter(s=>s).length
    })

    return  Math.max(...lengths);
}

console.log(senatnces("We test coders. Give us a try?"))
console.log(senatnces("Forget  CVs..Save time . x x"))