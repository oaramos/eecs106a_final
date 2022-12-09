#!/usr/bin/env python
from geometry_msgs.msg import Twist
import numpy as np
import rospy
from std_srvs.srv import Empty
from mario_kart.srv import item   # Service type
from turtlesim.srv import TeleportAbsolute
import sys



def item_callback(request):
    # Publish to cmd_vel at 5 Hz
    rate = rospy.Rate(5)
    vel = request.vel  # Linear velocity
    omega = request.omega  # Angular velocity
    pub = rospy.Publisher(
        '/cmd_vel', Twist, queue_size=50)

    cmd = Twist()
    cmd.linear.x = vel
    cmd.angular.z = omega

    pub.publish(cmd)  # Publish to cmd_vel
    rate.sleep()  # Sleep until 
    return cmd # This line will never be reached

def item_server():
    # Initialize the server node for turtle1
    rospy.init_node('item_server')
    # Register service
    rospy.Service(
        '/item/server',  # Service name
        item,  # Service type
        item_callback  # Service callback
    )
    rospy.loginfo('Running item server...')
    rospy.spin() # Spin the node until Ctrl-C


if __name__ == '__main__':
    item_server()

