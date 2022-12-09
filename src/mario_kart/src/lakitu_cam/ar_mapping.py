#!/usr/bin/env python

import rospy
import tf2_ros
import tf2_geometry_msgs
import geometry_msgs.msg
import tf_conversions


# Python's syntax for a main() method
if __name__ == '__main__':

    # Run this program as a new node in the ROS computation graph called
    # /listener_<id>, where <id> is a randomly generated numeric string. This
    # randomly generated name means we can start multiple copies of this node
    # without having multiple nodes with the same name, which ROS doesn't allow.
    rospy.init_node('ar_mapping')
    tfBuffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tfBuffer)

    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        try:
            ar_transf = tfBuffer.lookup_transform("ar_marker_3", "usb_cam", rospy.Time.now())
        except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
            rate.sleep()
            continue
        
        ar_2 = geometry_msgs.msg.PoseStamped()
        ar_2.header.stamp = ar_transf.header.stamp
        ar_2.header.frame_id = ar_transf.header.frame_id
        ar_2.pose.position.x = ar_transf.transform.translation.x
        ar_2.pose.position.y = ar_transf.transform.translation.y
        ar_2.pose.position.z = ar_transf.transform.translation.z
        ar_2.pose.orientation.x = ar_transf.transform.rotation.x
        ar_2.pose.orientation.y = ar_transf.transform.rotation.y
        ar_2.pose.orientation.z = ar_transf.transform.rotation.z
        ar_2.pose.orientation.w = ar_transf.transform.rotation.w


        tfBuffer.transform(ar_2, 'map')
        rate.sleep()