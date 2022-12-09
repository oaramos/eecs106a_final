#!/usr/bin/env python
from geometry_msgs.msg import Twist
import numpy as np
import rospy
from std_srvs.srv import Empty
from mario_kart.srv import item   # Service type
from turtlesim.srv import TeleportAbsolute
import sys



def item_callback(request):
    pub = rospy.Publisher(
        '/item/cmd_vel', Twist, queue_size=50)
    # Publish to cmd_vel at 5 Hz
    rate = rospy.Rate(5)
    while not rospy.is_shutdown():
        pub.publish(request)  # Publish to cmd_vel
        rate.sleep()  # Sleep until 
    return request  # This line will never be reached

def item_server():
    # Initialize the server node for turtle1
    rospy.init_node('item_server')
    # Register service
    rospy.Service(
        '/item/server',  # Service name
        Twist,  # Service type
        item_callback  # Service callback
    )
    rospy.loginfo('Running item server...')
    rospy.spin() # Spin the node until Ctrl-C


if __name__ == '__main__':
    item_server()

