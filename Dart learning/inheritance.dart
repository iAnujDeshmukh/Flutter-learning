void main() {
  Car car = Car();
  print(car.isEngineWorking);
  print(car.numberOfWheels);

  Truck truck = Truck();
  print(truck.isEngineWorking);

  Vehicle someRandomVehicle = Car();
  print((someRandomVehicle as Car).numberOfWheels);
}

// is-a relation - this is when you use inheritance

class Vehicle {
  int speed = 10;
  bool isEngineWorking = false;
  bool isLightOn = true;
  int numberOfWheels = 10;

  void accelerate() {
    speed += 10;
  }
}

class Truck extends Vehicle {
  int numberOfWheels = 8;
}

class Car extends Vehicle {
  int numberOfWheels = 4;
}

class Bike implements Vehicle {
  int numberOfWheels = 2;
}
