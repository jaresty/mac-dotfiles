import datetime


now = datetime.datetime.now()
current_index = 0


def command_index():
    global current_index, now
    if (datetime.datetime.now() - now).total_seconds() >= 10:
        print("Resetting current index to zero.")
        current_index = 0
    now = datetime.datetime.now()
    current_index += 1
    return current_index
