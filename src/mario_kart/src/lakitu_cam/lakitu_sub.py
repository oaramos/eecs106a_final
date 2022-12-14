#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from mario_kart.msg import positions
import tf2_ros
import tf2_msgs.msg
from ar_track_alvar_msgs.msg import AlvarMarkers

TURTLEBOT_MARKER = "ar_marker_1"
FINISH_LINE_MARKER = "ar_marker_3"

def publish_positions(curr_position_msg):
    r = rospy.Rate(5)
    pub = rospy.Publisher('lakitu', positions, queue_size=10)
    pub.publish(curr_position_msg)
    #print('*****PUBLISHED POSITION_MSG*****')
    r.sleep()


def callback(transforms_msg):

    # Print the contents of the message to the console 
    
    position_msg = positions()

    #for x in markers_msg.markers:
     #   x.pose.postions.x *= 10
      #  x.pose.postions.y *= 10

    #print(transforms_msg)

    for x in range(len(transforms_msg.transforms)):
        #if marker is turtlebot
        if transforms_msg.transforms[x].child_frame_id == TURTLEBOT_MARKER:
            position_msg.mario_position = transforms_msg.transforms[x]
        #if marker is finish_line
        elif transforms_msg.transforms[x].child_frame_id== FINISH_LINE_MARKER:
            position_msg.finish_line_position = transforms_msg.transforms[x]
        # else:
        #     position_msg.items_position.append(transforms_msg.transforms[x])


    print(f"*****POSITION_MSG*****: \n{position_msg}\n ***************")

    publish_positions(position_msg)

# Define the method which contains the node's main functionality
def lakitu():
    print("tracking positions:")
    # Create a new instance of the rospy.Subscriber object which we can use to
    # receive messages of type std_msgs/String from the topic /chatter_talk.
    # Whenever a new message is received, the method callback() will be called
    # with the received message as its first argument.
    rospy.Subscriber("/tf", tf2_msgs.msg.TFMessage, callback)

    # Wait for messages to arrive on the subscribed topics, and exit the node
    # when it is killed with Ctrl+C
    rospy.spin()


# Python's syntax for a main() method
if __name__ == '__main__':

    # Run this program as a new node in the ROS computation graph called
    # /listener_<id>, where <id> is a randomly generated numeric string. This
    # randomly generated name means we can start multiple copies of this node
    # without having multiple nodes with the same name, which ROS doesn't allow.
    rospy.init_node('lakitu')

    lakitu()