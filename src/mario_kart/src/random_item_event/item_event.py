#!/usr/bin/env python
# The line above tells Linux that this file is a Python script, and that the OS
# should use the Python interpreter in /usr/bin/env to run it. Don't forget to
# use "chmod +x [filename]" to make this script executable.

# Import the dependencies as described in example_pub.py
import rospy
import math
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from mario_kart.msg import positions
from mario_kart.srv import item
import random

used_items = []

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
    print(item_key)
    item_props = random_items[item_key]
    item_msg = Twist()
    item_msg.linear.x = item_props['linear']
    item_msg.angular.x = item_props['angular']
    return item_msg

# Define the callback method which is called whenever this node receives a 
# message on its subscribed topic. The received message is passed as the first
# argument to callback().
def callback(msg):

    position_kart_x = msg.mario_position.pose.position.x
    position_kart_y = msg.mario_position.pose.position.y

    position_items = msg.items_position
    for item in position_items:
        if math.dist([position_kart_x, position_kart_y], [item.pose.position.x, item.pose.position.y]) <= .5:
            print('triggered')
            if not item.header.frame_id in used_items:
                # needs to get what the item is and have it affect the bot
                # Initialize the client node 
                # Wait untill service is ready
                rospy.wait_for_service('/item/server')
                try:
                    # Acquire service proxy
                    
                    item_proxy = rospy.ServiceProxy(
                        '/item/server', item)
                    rospy.loginfo('Activate item')
                    # Call patrol service via the proxy
                    my_item = activate_item()
                    
                    item_proxy(my_item.linear.x, my_item.angular.x)
                    used_items.append(item.header.frame_id)
                    print('TEST')
                    
                except rospy.ServiceException as e:
                    rospy.loginfo(e)
                


# Define the method which contains the node's main functionality
def listener():
    # Create a new instance of the rospy.Subscriber object which we can use to
    # receive messages of type std_msgs/String from the topic /chatter_talk.
    # Whenever a new message is received, the method callback() will be called
    # with the received message as its first argument.
    rospy.Subscriber("lakitu", positions, callback)

    # Wait for messages to arrive on the subscribed topics, and exit the node
    # when it is killed with Ctrl+C
    rospy.spin()


# Python's syntax for a main() method
if __name__ == '__main__':

    # Run this program as a new node in the ROS computation graph called
    # /listener_<id>, where <id> is a randomly generated numeric string. This
    # randomly generated name means we can start multiple copies of this node
    # without having multiple nodes with the same name, which ROS doesn't allow.
    rospy.init_node('item_event')
    listener()
