/* 
List<String> inputList = ["P", "P", "P", "P", "WE", "WE", "N", "N", "N", "N", "N", "S", "S", "P","P",”Z”];
// Output: [’S”, 'S', 'WE', 'WE', ’N’, 'N', ’S’, ’S’]
// Ex [’S->0’, 'S->3’, 'WE->4’, 'WE->5’, 'N->6’, ’N->10’, ’S->11’, ’S->14’]
Example :- We have “P” in the list and have the 6th time in the list so first P and Last P should be added in a new List and if there is only one value in the list then it should not be added.
*/

// Though I think the given example doesn't match the output, I have implemented whatever I understood.

void main() {
  List<String> inputList = [
    "P",
    "P",
    "P",
    "P",
    "WE",
    "WE",
    "N",
    "N",
    "N",
    "N",
    "N",
    "S",
    "S",
    "P",
    "P",
    "Z"
  ];

  final Map<String, int> counts = {};

  for (final e in inputList) {
    if (counts.containsKey(e)) {
      counts[e] = counts[e]! + 1;
    } else {
      counts.putIfAbsent(e, () => 1);
    }
  }

  final resultList = [...inputList];
  counts.forEach((key, value) {
    if (value == 1) {
      resultList.remove(key);
    }
  });

  print("Input: $inputList");
  print("Result: $resultList");
}
