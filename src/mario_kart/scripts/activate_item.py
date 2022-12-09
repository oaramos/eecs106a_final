import random
# import rospy
# import sys
# from geometry_msgs.msg import Twist

random_items={
    'MUSHROOM': {
        'linear': 1,
        'angular': 0
    },
    'POISON MUSHROOM': {
        'linear': 0,
        'angular': 0
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
    item_props = random_items[item_key]
    item_msg = Twist()
    item_msg.linear.x = item_props['linear']
    item_msg.angular.x = item_props['angular']
    return item_msg

