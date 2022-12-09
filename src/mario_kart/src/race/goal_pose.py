#!/usr/bin/env python

import rospy
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from mario_kart.msg import positions



def active_cb(extra):
    rospy.loginfo("Goal pose being processed")

def feedback_cb(feedback):
    rospy.loginfo("Current location: "+str(feedback))
    #Change to x?
    goal_line = goal.pose.position.y - .15
    if feedback.pose.positon.y in range(goal_line - .05, goal_line + .05):
        print("FINISH LINE REACHED")
        navclient.cancel_goal()

def done_cb(status, result):
    if status == 3:
        rospy.loginfo("Goal reached")
    if status == 2 or status == 8:
        rospy.loginfo("Goal cancelled")
    if status == 4:
        rospy.loginfo("Goal aborted")
    
if __name__ == "__main__":

    rospy.init_node('start_race')

    navclient = actionlib.SimpleActionClient('move_base',MoveBaseAction)
    navclient.wait_for_server()

    positions = rospy.wait_for_message('/laktitu', positions)
    finish_tag = positions.finish_line_position
    # Example of navigation goal
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()


    goal.target_pose.pose.position.x = finish_tag.transform.translation.x
    goal.target_pose.pose.position.y = finish_tag.transform.translation.y
    goal.target_pose.pose.position.z = 0.0
    goal.target_pose.pose.orientation.x = finish_tag.transform.rotation.x
    goal.target_pose.pose.orientation.y = finish_tag.transform.rotation.y
    goal.target_pose.pose.orientation.z = finish_tag.transform.rotation.z
    goal.target_pose.pose.orientation.w = finish_tag.transform.rotation.w

    navclient.send_goal(goal, done_cb, active_cb, feedback_cb)
    finished = navclient.wait_for_result()

    if not finished:
        rospy.logerr("Action server not available!")
    else:
        rospy.loginfo(navclient.get_result())
