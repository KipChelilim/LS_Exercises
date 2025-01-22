function objectsEqual(obj1, obj2) {
  if (obj1 === obj2) return true;

  let obj1Properties = Object.getOwnPropertyNames(obj1).sort();
  let obj2Properties = Object.getOwnPropertyNames(obj2).sort();
  if (obj1Properties.length !== obj2Properties.length) return false;

  return obj1Properties.every((prop, idx) => {
    return obj1.prop === obj2.prop && obj1Properties[idx] === obj2Properties[idx]
  });
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({a: 'foo', b: 'bar'}, {b: "bar", a: 'foo'}));  // true
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false