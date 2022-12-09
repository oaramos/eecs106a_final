#!/usr/bin/env python

import rospy
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from mario_kart.msg import positions
import tf_conversions



def active_cb():
    rospy.loginfo("Goal pose being processed")

def feedback_cb(feedback):
    rospy.loginfo("Current location: "+str(feedback))
    #Change to x?
    #goal_line = goal.pose.position.y - .15
    #if feedback.pose.positon.y in range(goal_line - .05, goal_line + .05):
        #print("FINISH LINE REACHED")
        #navclient.cancel_goal()

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
    print('client')
    positions = rospy.wait_for_message('lakitu', positions)
    finish_tag = positions.finish_line_position
 
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()

    goal.target_pose.pose.position.x = finish_tag.pose.position.x
    goal.target_pose.pose.position.y = -finish_tag.pose.position.y

    goal.target_pose.pose.orientation.x = 0
    goal.target_pose.pose.orientation.y = 0
    goal.target_pose.pose.orientation.z = -finish_tag.pose.orientation.z
    goal.target_pose.pose.orientation.w = finish_tag.pose.orientation.w

    # goal.target_pose.pose.position.x = 0.302
    # goal.target_pose.pose.position.y = 0.29
    # goal.target_pose.pose.orientation.x = 0.0
    # goal.target_pose.pose.orientation.y = 0.0
    # goal.target_pose.pose.orientation.z = -0.045314469250198046
    # goal.target_pose.pose.orientation.w = 0.9989727718394396



    print(goal)
    goal = navclient.send_goal(goal, done_cb, active_cb, feedback_cb)
    finished = navclient.wait_for_result()

    if not finished:
        rospy.logerr("Action server not available!")
    else:
        rospy.loginfo(navclient.get_result())
