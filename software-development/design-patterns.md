# [Repository Pattern in Golang](https://jorzel.github.io/repository-pattern-in-golang-redis-and-external-api-as-providers/)

A repository acts as a mediator between the application and the data source. 

Encapsulates the logic for retrieving, storing, and querying data. 

Application interacts with the repository instead of directly accessing the database or other data sources.

Main benefit of using a repository pattern is that we can write application code without an assumption about the data provider in front (e.g. filesystem, database, external API).  Allows testing / mocking.

# [Python Design Patterns](https://python-patterns.guide/)

# [10 Design Patterns Explained in 10 Minutes - Fireship](https://youtu.be/tv-_1er1mWI?si=SvXi61M0vZajeoWt)

## Creational

How objects created

### Singleton

Object that can only be instantiated once

```python
```

### Prototype

Cloning - alternative to inheritance

- instead of inheriting from a class, the functionality comes from an existing object

```python
import copy

class Product:
    def __init__(self, name, configuration):
        self.name = name
        self.configuration = configuration

    def clone(self):
        return copy.deepcopy(self)

# Usage
base_product = Product("Computer", {"RAM": "8GB", "Storage": "256GB"})
gaming_product = base_product.clone()
gaming_product.configuration["RAM"] = "32GB"
gaming_product.configuration["Graphics Card"] = "NVIDIA GTX 3080"

print(base_product.configuration)  # {"RAM": "8GB", "Storage": "256GB"}
print(gaming_product.configuration)  # {"RAM": "32GB", "Storage": "256GB", "Graphics Card": "NVIDIA GTX 3080"}
```

### Builder

Create an object step by step using methods 

- method chaining
- can delegate logic to another class
- use `return self` a lot

```python

lunch = HotDog()
lunch.add_ketchup().add_mustard()
```

### Factory

Use a function to create an object

```python
class User:
    pass

class Admin(User):
    def access(self) -> None:
        print("Admin access granted")

class Guest(User):
    def access(self) -> None:
        print("Guest access granted")

def create_user(role: str) -> User:
    if role == "admin":
        return Admin()
    elif role == "guest":
        return Guest()
    else:
        raise ValueError("Unknown user role")

user = create_user("admin")
user.access()
user = create_user("guest")
user.access()
```


## Structural

How objects relate to each other

### Facade

Interface / API

- hiding implementation

```python
```

### Proxy

Substitute for another object

- takes object as argument, then changes it
- can be useful for large in memory objects (avoiding copy or delaying loading data until needed)

```python
class Database:
    def query(self, sql: str) -> None:
        print(f"exec query: {sql}")

class DatabaseProxy:
    def __init__(self, database: Database) -> None:
        self.database: Database = database

    def query(self, sql: str) -> None:
        print(f"log query: {sql}")
        self.database.query(sql)

database = DatabaseProxy(Database())
database.query("SELECT * FROM users")
```


## Behavioral

How objects communicate with each other

### Iterator

Looping

- pull based system

```python
```

### Observer

Listening / subscribing to events

- push based system

```python
class WeatherStation:
    def __init__(self) -> None:
        self.observers: List[Observer] = []
        self.temperature: int = 0

    def register_observer(self, observer: Observer) -> None:
        self.observers.append(observer)

    def notify_observers(self) -> None:
        for observer in self.observers:
            observer.update(self.temperature)

    def set_temperature(self, temp: int) -> None:
        self.temperature = temp
        self.notify_observers()

class TemperatureDisplay:
    def update(self, temperature: int) -> None:
        print(f"Temperature Display: Current Temperature is {temperature}°C")

weather_station = WeatherStation()
for display in [
    TemperatureDisplay(),
    TemperatureDisplay(),
]:
    weather_station.register_observer(display)

weather_station.set_temperature(25)
weather_station.set_temperature(24)
```

### Mediator

Middleman / broker

- sits in the middle of many-to-many relationships

```python
class ChatRoom:
    def display_message(self, user: 'User', message: str) -> None:
        print(f"{user.name}: {message}")

class User:
    def __init__(self, name: str, chat_room: ChatRoom) -> None:
        self.name = name
        self.chat_room = chat_room

    def send_message(self, message: str) -> None:
        self.chat_room.display_message(self, message)

chat_room = ChatRoom()
alice = User("Alice", chat_room)
bob = User("Bob", chat_room)
charlie = User("Charlie", chat_room)

alice.send_message("Hi Bob!")
bob.send_message("Hey Alice!")
charlie.send_message("Hey Everyone!")
```

### State

Object behaves differently based on its interval state

- finite state machines
- state set equal to an object that implements different functionality

```python
from rich import print

class TrafficLightState:
    def change(self, traffic_light: "TrafficLight") -> None:
        pass


class RedLight(TrafficLightState):
    def change(self, traffic_light: "TrafficLight") -> None:
        print(":stop_sign: [red]Stop[/]")
        traffic_light.state = GreenLight()


class YellowLight(TrafficLightState):
    def change(self, traffic_light: "TrafficLight") -> None:
        print(":yellow_circle: [yellow]Caution[/]")
        traffic_light.state = RedLight()


class GreenLight(TrafficLightState):
    def change(self, traffic_light: "TrafficLight") -> None:
        print(":checkered_flag: [green]Go[/]\n")
        traffic_light.state = YellowLight()


class TrafficLight:
    def __init__(self) -> self:
        self.state: TrafficLightState = YellowLight()

    def change(self) -> None:
        self.state.change(self)


traffic_light = TrafficLight()
for _ in range(6):
    traffic_light.change()
```
