"use strict";

// Should implement these as object literals since sample code requires running methods directly
// on objects. Otherwise, would instantiate objects to store the ItemManager and Report gnerators

class Item {
  constructor(itemName, category, quantity) {
    if (Item.isValidItem(itemName, category, quantity)) {
      this.itemName = itemName;
      this.category = category;
      this.quantity = quantity;
      this.skuCode = Item.createSKUCode(itemName, category);
    } else {
      this.notValid = true;
    }
  }

  static createSKUCode(itemName, category) {
    let itemNameChars = itemName.match(/[a-z]/gi).slice(0, 3).join('');
    let categoryChars = category.slice(0, 2);
    return (itemNameChars + categoryChars).toUpperCase();
  }

  static isValidItem(itemName, category, quantity) {
    let itemNameRegex = /([a-zA-Z] *){5}/;
    let categoryRegexTest = /^[a-zA-Z]{5,}$/;

    return (
      itemNameRegex.test(itemName) &&
        categoryRegexTest.test(category) &&
        typeof quantity === 'number'
    );
  }
}

class ItemManager {
  static items = []

  static create(name, category, quantity) {
    let item = new Item(name, category, quantity);
    if (item.notValid) {
      return false;
    } else {
      return ItemManager.items.push(item);
    }
  }

  // does SKU update if name or category updates?
  // need to update ItemManager to handle these updates
  static update(sku, { itemName, category, quantity }) {
    let item = this.selectItem(sku);
    if (itemName) item.itemName = itemName;
    if (category) item.category = category;
    if (quantity !== undefined) item.quantity = quantity;
    if (itemName || category) {
      item.skuCode = Item.createSKUCode(item.itemName, item.category);
    }

    return item;
  }

  static delete(sku) {
    let item = this.selectItem(sku);
    let idx = this.items.indexOf(item);
    this.items.splice(idx, 1);
    return item;
  }

  static inStock() {
    return this.items.filter((item) => item.quantity > 0);
  }

  static itemsInCategory(category) {
    return this.items.filter((item) => item.category === category);
  }

  static selectItem(sku) {
    return this.items.filter((item) => item.skuCode === sku)[0];
  }

}

class ReportManager {
  static items;

  static init(itemManager) {
    this.items = itemManager;
  }

  static createReporter(sku) {
    let self = this;
    return {
      itemInfo() {
        let item = self.items.selectItem(sku)
        console.log(`skuCode: ${item.skuCode}`);
        console.log(`itemName: ${item.itemName}`);
        console.log(`category: ${item.category}`);
        console.log(`quantity: ${item.quantity}`);
      }
    };
  }

  static reportInStock() {
    console.log(this.items.inStock().map((item) => item.itemName).join(','));
  }
}

ItemManager.create('basket ball', 'sports', 0);           // valid item
ItemManager.create('asd', 'sports', 0);
ItemManager.create('soccer ball', 'sports', 5);           // valid item
ItemManager.create('football', 'sports');
ItemManager.create('football', 'sports', 3);              // valid item
ItemManager.create('kitchen pot', 'cooking items', 0);
ItemManager.create('kitchen pot', 'cooking', 3);          // valid item

ItemManager.items;
// returns list with the 4 valid items

ReportManager.init(ItemManager);
ReportManager.reportInStock();
// logs soccer ball,football,kitchen pot

ItemManager.update('SOCSP', { quantity: 0 });
ItemManager.inStock();
// returns list with the item objects for football and kitchen pot
ReportManager.reportInStock();
// logs football,kitchen pot
ItemManager.itemsInCategory('sports');
// returns list with the item objects for basket ball, soccer ball, and football
ItemManager.delete('SOCSP');
ItemManager.items;
// returns list with the remaining 3 valid items (soccer ball is removed from the list)

const kitchenPotReporter = ReportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 3

ItemManager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();
// logs
// skuCode: KITCO
// itemName: kitchen pot
// category: cooking
// quantity: 10