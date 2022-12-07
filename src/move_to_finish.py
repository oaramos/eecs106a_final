#!/usr/bin/env python
import rospy 


from geometry_msgs.msg import Point, Twist
from sensor_msgs.msg import LaserScan 
from tf import transformations 

from mario_kart.msg import positions
import math 

position = Point()
desired_position = Point()
yaw = 0 
state = 0 
yaw_error = 5 * (math.pi / 180)
dist_precision = 0.3 

pub = None 
def callback(msg):
    global desired_position, position, yaw
    desired_position.x = msg.finish_line.pose.position.x
    desired_position.y = msg.finish_line.pose.position.y
    desired_position.z = 0   

    position.x = msg...
    position.y = msg...
    position.z = 0 

    quaternion = (
        #getting orientation from msg
        msg.pose.pose.orientation.x, 
        msg.pose.pose.orientation.y,
        msg.pose.pose.orientation.z
        msg.pose.pose.orientation.w
    )
    euler = transformations.euler_from_quaternion(quaternion)
    #roll = euler[0]
    #pitch = euler[1]
    yaw = euler[2]

def change_state(curr_state):
    global state
    state = curr_state
    print('state changed to [%s]' % err_yaw)

def fix_yaw(des_pos):
    global yaw, pub, yaw_error, state
    desired_yaw = math.atan2(des_pos.y - position.y, des_pos.x - position.x)
    err_yaw = desired_yaw - yaw

    twist_msg = Twist()
    if math.fabs(err_yaw) > yaw_error:
        twist_msg.angular.z = 0.7 if err_yaw > 0 else -0.7

    pub.publish(twist_msg)

    if math.fabs(err_yaw) <= yaw_precision:
        change_state(1)

def go_straight(des_pos):
    global yaw, pub, yaw_error, state
    desired_yaw = math.atan2(des_pos.y - position.y, des_pos.x - position.x)
    err_yaw = desired_yaw - yaw
    err_pos = math.sqrt(pow(des_pos.y - position.y, 2) + pow(des_pos.x - position.x, 2))


    if err_pos > dist_error:
        twist_msg = Twist()
        twist_msg.linear.x = 0.2
        pub.publish(twist_msg)
    else:
        print("Position error: [%s]" % err_pos)
        change_state(2)
    if math.fabs(err_yaw) > yaw_error:
        change_state(0)

def done():
    twist_msg = Twist()
    twist_msg.linear.x = 0 
    twist_msg.angular.z = 0
    pub.publish(twist_msg)


def main():
    global pub 

    rospy.init_node("going_to_finish")
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    #sub = rospy.Subscriber('/odom', Odometry, callback_odom)
    rospy.Subscriber("lakitu", positions, callback)
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


if __name__ == '__main__':
    main()