/*
Task - 3
Input
var arr = [3,2,4,6,1,7,8,5,9];
var n = 4;
The output will start with the 4th position
[1,7,8,5,9,3,2,4,6]
If n = 6
Then Output will start with the 6th position
[8,5,9,3,2,4,6,1,7]

Example :- we enter 4 then List should start  from 4 value positions and should be added before all the 4 Position values should be added in the same list but In the end.
*/

// Similar to the: https://leetcode.com/submissions/detail/1421080561

void main() {
  final arr = [3, 2, 4, 6, 1, 7, 8, 5, 9];
  const n = 6;

  if (n >= arr.length) {
    throw Exception('n should be less than the length of the array');
  }

  final subList = arr.sublist(n, arr.length);
  arr.removeRange(n, arr.length);
  arr.insertAll(0, subList);

  print(arr);
}
