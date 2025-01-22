// Because of line 10 below, the price of this object is updated with every discount tested.
// Instead of reassigning the price to the discounted price, the function should just return the
// result of price less the discount.

const item = {
  name: 'Foo',
  description: 'Fusce consequat dui est, semper.',
  price: 50,
  quantity: 100,
  discount(percent) {
    const discount = this.price * percent / 100;
    return this.price - discount;
  },
};

console.log(item.discount(20));   // should return 40
console.log(item.discount(50));   // should return 25
console.log(item.discount(25));   // should return 37.5
