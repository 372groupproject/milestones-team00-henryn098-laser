/*maps work in dart like in python and java, with
k,v pairs mapping keys to values*/
main(){
  //nothing much different here
  //maps can be created from iteratables,
  //a list of identifiable objects (hashmap)
  //from a list of entries, ect
  //or from nothing
  Map<int,String> map = new Map();
  //you can update without looking,
  map[1] = 'a';
  //you can get values out of them
  print(map[1]);
  //you can union them with other maps
  var map2 = {2: 'b', 3: 'c'};
  map.addAll(map2);
  print(map);
  //it has fields of keys and values
  print(map.keys);
  print(map.values);

  //and of course you can update values
  map[1] = 'e';

  //if there is no valid key, then it returns null
  print(map[5]);

  //failing: you cannont iterate over them
  /*
  for (var key in map) {
    map[key]+= 'FFFF';
  }
  print(map);
  */

  //but a lambda in the forEach takes care of that
  map.forEach((k,v) => map[k]=v+'F');
  print(map);
}