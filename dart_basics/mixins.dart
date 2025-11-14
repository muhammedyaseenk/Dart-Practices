// mixins are a way of reusing a class's code in multiple class hierarchies.
// this is similar to inheritance, but with mixins, you can mix in multiple classes.

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

mixin ElectricVariant {
  void electricVariant() {
    print('This is an electric variant');
  }
}

mixin PetrolVariant {
  void petrolVariant() {
    print('This is a petrol variant');
  }
}

// class Car with multiple mixins Musical, ElectricVariant, PetrolVariant
class Car with Musical, ElectricVariant, PetrolVariant {
  // You can add properties or methods here if needed
}

void main() {
  var car = Car();

  // Setting mixin properties
  car.canPlayPiano = true;
  car.canConduct = false;

  car.electricVariant();  // prints: This is an electric variant
  car.petrolVariant();    // prints: This is a petrol variant
  car.entertainMe();      // prints: Playing piano
}


// What Is Allowed For Mixin
//   You can add properties and static variables.
//   You can add regular, abstract, and static methods.
//   You can use one or more mixins in a class.
// What Is Not Allowed For Mixin
//   You can’t define a constructor.
//   You can’t extend a mixin.
//   You can’t create an object of mixin.


// in python we can achieve similar functionality using multiple inheritance or by using composition with classes.
// # Car class inherits from multiple mixins
// class Car(Musical, ElectricVariant, PetrolVariant):
//     def __init__(self):
//         super().__init__()  # initialize Musical's __init__

// if __name__ == "__main__":
    // car = Car()