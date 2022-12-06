#! /usr/bin/env python

import rospy
from std_msgs.msg import String
from ar_track_alvar_msgs import AlvarMarkers

def callback(usr_message):

    # Print the contents of the message to the console
    usr_string = usr_message
    print(usr_string)

# Define the method which contains the node's main functionality
def lakitu():
    print("Received messages:")
    # Create a new instance of the rospy.Subscriber object which we can use to
    # receive messages of type std_msgs/String from the topic /chatter_talk.
    # Whenever a new message is received, the method callback() will be called
    # with the received message as its first argument.
    rospy.Subscriber("ar_pose_marker", AlvarMarkers, callback)

    # Wait for messages to arrive on the subscribed topics, and exit the node
    # when it is killed with Ctrl+C
    rospy.spin()


# Python's syntax for a main() method
if __name__ == '__main__':

    # Run this program as a new node in the ROS computation graph called
    # /listener_<id>, where <id> is a randomly generated numeric string. This
    # randomly generated name means we can start multiple copies of this node
    # without having multiple nodes with the same name, which ROS doesn't allow.
    rospy.init_node('lakitu', anonymous=True)

    lakitu()