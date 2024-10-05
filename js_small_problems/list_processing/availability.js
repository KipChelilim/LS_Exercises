const transactionsFor = function(id, transactions) {
  return transactions.filter((transaction) => transaction.id === id);
}


const isItemAvailable = function isItemMovementAvailable(id, transactions) {
  let matchingTransactions = transactionsFor(id, transactions);
  let remainingQuantity = matchingTransactions.reduce((sum, transaction) => {
    let quantityChange = transaction.movement === 'in' ? transaction.quantity : -transaction.quantity;
    return sum + quantityChange;
  }, 0);

  return remainingQuantity > 0;
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions));     // false
console.log(isItemAvailable(105, transactions));     // true