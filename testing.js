const N = 679;
let m = 0;
function MultiplicPersistance(n) {
  let StrN = String(n);
  if (StrN.length <= 1) {
    m++;
    let arr = StrN.split("");
    arr.map(Number.parseInt, arr);
    let n2 = 1;
    for (let i = 0; i <= arr.length; i++) {
      n2 *= arr[i];
    }
    MultiplicPersistance(n2)
  }
  else {
    return m;
  }
}
console.log('The multiplicative persistence of N' + MultiplicPersistance(N));