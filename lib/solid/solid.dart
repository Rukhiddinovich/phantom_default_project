// Single Responsibility Principle (SRP) SOLID <<< PHANTOM >>>
class Order {
  String orderNumber;
  List<Item> items;

  Order({required this.items, required this.orderNumber});

  void printOrder() {
    // Print the order details
  }
}

class Item {
  String name;
  double price;

  Item({required this.name, required this.price});
}

// Open/Closed Principle (OCP)
abstract class Shape {
  double area();
}

class Circle extends Shape {
  double radius;

  Circle({required this.radius});

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle({required this.height, required this.width});

  @override
  double area() {
    return width * height;
  }
}

// Liskov Substitution Principle (LSP)
abstract class Bird {
  void fly();
}

class Sparrow extends Bird {
  @override
  void fly() {
    // Implement flying behavior for Sparrows
  }
}

class Ostrich extends Bird {
  @override
  void fly() {
    // Ostriches cannot fly, so this method does nothing
  }
}

// Interface Segregation Principle (ISP)
abstract class Worker {
  void work();
}

abstract class Eater {
  void eat();
}

class Engineer implements Worker, Eater {
  @override
  void work() {
    // Implement work for engineers
  }

  @override
  void eat() {
    // Implement eat for engineers
  }
}

class Waiter implements Worker, Eater {
  @override
  void work() {
    // Implement work for waiters
  }

  @override
  void eat() {
    // Implement eat for waiters
  }
}

// Dependency Inversion Principle (DIP)
class LightBulb {
  void turnOn() {
    // Turn on the light bulb
  }
}

class Switch {
  LightBulb bulb;

  Switch(this.bulb);

  void operate() {
    // Operate the switch to turn on/off the bulb
  }
}
