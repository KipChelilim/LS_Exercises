// name property added to make objects easier to identify
const foo = {name: 'foo'};
foo.ancestors = function(result = []) {
  let ancestor = Object.getPrototypeOf(this);
  if (ancestor === Object.prototype) {
    result.push('Object.prototype');
    return result;
  } else if (ancestor === null) {
    return result;
  }

  result.push(ancestor.name);
  return ancestor.ancestors(result);
}

const bar = Object.create(foo);
bar.name = 'bar';
const baz = Object.create(bar);
baz.name = 'baz';
const qux = Object.create(baz);
qux.name = 'qux';

console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
console.log(foo.ancestors());  // returns ['Object.prototype']