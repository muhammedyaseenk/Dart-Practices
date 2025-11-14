# import msvcrt
# import time
# import sys

# def main():
#     print("Enter your name (you have 5 seconds):")
    
#     input_chars = []
#     timeout = 5
#     remaining = timeout
#     last_typed_time = None

#     while remaining > 0:
#         # Check if a key was pressed
#         if msvcrt.kbhit():
#             char = msvcrt.getwch()

#             if char in ('\r', '\n'):
#                 break  # User pressed Enter
#             elif char == '\b':  # Handle backspace
#                 if input_chars:
#                     input_chars.pop()
#                     print('\b \b', end='', flush=True)
#             else:
#                 input_chars.append(char)
#                 print(char, end='', flush=True)

#             last_typed_time = time.time()  # Reset timer when user types
#         else:
#             # No key press
#             now = time.time()

#             if last_typed_time is None:
#                 time.sleep(1)
#                 remaining -= 1
#                 print(f"\n{remaining}...", flush=True)
#             else:
#                 idle_time = now - last_typed_time
#                 if idle_time >= 1:
#                     time.sleep(1)
#                     remaining -= 1
#                     print(f"\n{remaining}...", flush=True)

#         # Small sleep to reduce CPU usage
#         time.sleep(0.05)

#     print()  # Newline after typing

#     if input_chars:
#         name = ''.join(input_chars).strip()
#         if name:
#             print(f"\nHello, {name}!")
#         else:
#             print("No name entered.")
#     else:
#         print("\nTime's up! Exiting...")
#         sys.exit(0)

# if __name__ == "__main__":
#     main()



import threading
import time
import sys
import queue

def get_input(q):
    name = input("Enter your name (you have 5 seconds):\n")
    q.put(name)

def main():
    q = queue.Queue()
    t = threading.Thread(target=get_input, args=(q,))
    t.daemon = True
    t.start()

    for i in range(15, 0, -1):
        if not q.empty():
            break
        print(f"{i}...")
        time.sleep(1)

    if q.empty():
        print("\nTime's up! Exiting...")
        sys.exit(0)
    else:
        name = q.get()
        if name.strip():
            print(f"Hello, {name}!")
        else:
            print("No name entered.")

if __name__ == "__main__":
    main()






# import threading
# import time
# import sys

# # Flag to track if input was received
# input_received = False

# def get_input():
#     global input_received
#     try:
#         name = input("Enter your name (you have 5 seconds):\n")
#         input_received = True
#         if name.strip():
#             print(f"Hello, {name}!")
#         else:
#             print("No name entered.")
#     except:
#         pass
#     finally:
#         sys.exit(0)

# # Start the input in a separate thread
# input_thread = threading.Thread(target=get_input)
# input_thread.daemon = True
# input_thread.start()

# # Countdown from 5
# for i in range(5, 0, -1):
#     if input_received:
#         break
#     print(f"{i}...")
#     time.sleep(1)

# # If no input was received after countdown
# if not input_received:
#     print("\nTime's up! Exiting...")
#     sys.exit(0)
