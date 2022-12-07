import random
# import rospy
# import sys
# from geometry_msgs.msg import Twist

random_items={
    'MUSHROOM': {
        'linear': 1,
    },
    'POISON MUSHROOM': {
        'linear': 0
    },
    'LIGHTNING': {
        'linear': 0,
        'angular': 1
    },
    'BLUE SHELL': {
        'linear': 0,
        'angular': 1
    },
}

def activate_item():
    item_key = random.choice(list(random_items.keys()))
    item = random_items[item_key]
    # item_msg = Twist()
    # item_msg.linear.x = item['linear']
    # if item.key == 'LIGHTNING' or item.key == 'BLUESHELL':
    #     item_msg.angular.z = item
    return item_msg

print(activate_item())