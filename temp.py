class ChatRoom:
    def display_message(self, user: "User", message: str) -> None:
        print(f"{user.name}: {message}")


class User:
    def __init__(self, name: str, chat_room: ChatRoom):
        self.name = name
        self.chat_room = chat_room

    def send_message(self, message: str) -> None:
        self.chat_room.display_message(self, message)


chat_room = ChatRoom()
user1 = User("Alice", chat_room)
user2 = User("Bob", chat_room)

user1.send_message("Hi Bob!")
user2.send_message("Hey Alice!")
