#!/usr/bin/env python
import rospy 

from geometry_msgs.msg import Point 
from sensor_msgs.msg import LaserScan
from tf import transformations 

from mario_kart.msg import positions
from std_srvs.srv import * 


import math 


desired_position = Point() 
position = Point()
yaw = 0 
yaw_error = 5 * (math.pi / 180) #error of 5 degrees 
dist_error = 0.3
state = 0 
regions = None

def main():
    global regions, position, desired_position, state, yaw, yaw_error

    rospy.init_node('path_planning')

    sub_laser = rospy.Subscriber('/m2wr/laser/scan', LaserScan, callback_laser)
    #sub_odom = rospy.Subscriber('/odom', Odometry, callback_odom)
    sub_pos =  rospy.Subscriber("lakitu", positions, callback)

    rate = rospy.Rate(20)

    while not rospy.is_shutdown():
        if state == 0:
            fix_yaw(desired_position)
        elif state == 1:
            go_straight(desired_position)
        elif state == 2:
            done()
            pass
        else:
            rospy.logger("UNknown state!")
            pass
        rate.sleep()

def callback(msg):
    global desired_position, position, yaw
    desired_position.x = msg.finish_line_position.pose.position.x
    desired_position.y = msg.finish_line_position.pose.position.y
    desired_position.z = 0 

    position.x = msg.mario_position.pose.position.x
    position.y = msg.mario_position.pose.position.y
    position.z = 0

    # yaw
    quaternion = (
        msg.mario_position.pose.orientation.x,
        msg.mario_position.pose.orientation.y,
        msg.mario_position.pose.orientation.z,
        msg.mario_position.pose.orientation.w)
    euler = transformations.euler_from_quaternion(quaternion)
    yaw = euler[2]

def change_state(curr_state):
    global state
    state = curr_state
    print('state changed to [%s]' % err_yaw)


def callback_laser(msg):
    #length of range data from LaserScan 
    idx = len(msg.ranges) // 5
    idx2 = idx+idx 
    idx3 = idx2+idx 
    idx4 = idx3+idx
    idx5 = idx4+idx
    regions = {
        'right' : min(min(msg.ranges[0:idx-1]), 10)
        'fright': min(min(msg.ranges[idx:idx2 - 1]), 10)
        'front' : min(min(msg.ranges[idx2:idx3-1]), 10)
        'fleft' : min(min(msg.ranges[idx3:idx4-1]), 10)
        'left'  : min(min(msg.ranges[idx4:idx5-1), 10)
    }
    rospy.loginfo(msg)



if __name__ == '__main__':
    main()



        

def normalize_angle(angle):
    if(math.fabs(angle) > math.pi):
        angle = angle - (2 * math.pi * angle) / (math.fabs(angle))
    return angle


    
    # set robot position
    model_state = ModelState()
    model_state.model_name = 'm2wr'
    model_state.pose.position.x = initial_position_.x
    model_state.pose.position.y = initial_position_.y
    resp = srv_client_set_model_state(model_state)
    
    # initialize going to the point
    change_state(0)
    
    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        if regions_ == None:
            continue
        
        if state_ == 0:
            if regions_['front'] > 0.15 and regions_['front'] < 1:
                change_state(1)
        
        elif state_ == 1:
            desired_yaw = math.atan2(desired_position_.y - position_.y, desired_position_.x - position_.x)
            err_yaw = normalize_angle(desired_yaw - yaw_)
            
            # less than 30 degrees
            if math.fabs(err_yaw) < (math.pi / 6) and \
               regions_['front'] > 1.5 and regions_['fright'] > 1 and regions_['fleft'] > 1:
                print 'less than 30'
                change_state(0)
            
            # between 30 and 90
            if err_yaw > 0 and \
               math.fabs(err_yaw) > (math.pi / 6) and \
               math.fabs(err_yaw) < (math.pi / 2) and \
               regions_['left'] > 1.5 and regions_['fleft'] > 1:
                print 'between 30 and 90 - to the left'
                change_state(0)
                
            if err_yaw < 0 and \
               math.fabs(err_yaw) > (math.pi / 6) and \
               math.fabs(err_yaw) < (math.pi / 2) and \
               regions_['right'] > 1.5 and regions_['fright'] > 1:
                print 'between 30 and 90 - to the right'
                change_state(0)
            
        rate.sleep()
