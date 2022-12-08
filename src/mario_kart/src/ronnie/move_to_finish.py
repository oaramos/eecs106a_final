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
state = 1
yaw_error = math.pi  / 5
dist_precision = 0.1

pub = None

def callback(msg):
    global desired_position, position, yaw
    desired_position.x = -0.24#msg.finish_line_position.pose.position.x
    desired_position.y = -0.07#msg.finish_line_position.pose.position.y
    desired_position.z = 0 #msg.finish_line_position.pose.position.z

    position.x = msg.mario_position.pose.position.x
    position.y = msg.mario_position.pose.position.y
    position.z = 0 #msg.mario_position.pose.position.z

    # yaw
    quaternion = (
        msg.mario_position.pose.orientation.x,
        msg.mario_position.pose.orientation.y,
        msg.mario_position.pose.orientation.z,
        msg.mario_position.pose.orientation.w)
    euler = transformations.euler_from_quaternion(quaternion)
    yaw = euler[2]
    print(f"Yaw is: {yaw}")
   
def change_state(curr_state):
    global state
    state = curr_state
    print('state changed to [%s]' % state)

def normalize_angle(angle):
    if (math.fabs(angle) > math.pi):
        angle = angle - (2 * math.pi * angle) / (math.fabs(angle))
    return angle
    
#def fix_yaw(des_pos):
#    global yaw, pub, yaw_error, state
#    desired_yaw = math.atan2(des_pos.y - position.y, des_pos.x - position.x)
#    err_yaw = normalize_angle(desired_yaw - yaw)
#    twist_msg = Twist()
#    if math.fabs(err_yaw) > yaw_error:
#        twist_msg.angular.z = 0.5 if err_yaw > 0 else -0.5
#    
#    pub.publish(twist_msg)
#
#    if math.fabs(err_yaw) <= yaw_error:
#        print('Yaw error: [%s]' % err_yaw)
#        change_state(1)

def go_straight(des_pos):
    global yaw, pub, yaw_error, state
    desired_yaw = math.atan2(des_pos.y - position.y, des_pos.x - position.x)
    err_yaw = normalize_angle(desired_yaw - yaw)
    err_pos = math.sqrt(pow(des_pos.y - position.y, 2) + pow(des_pos.x - position.x, 2))


    if err_pos > dist_precision:
        twist_msg = Twist()
        twist_msg.linear.x = 0.5
        twist_msg.angular.z = 0.5 if err_yaw > 0 else -0.5
        pub.publish(twist_msg)
    else:
        print("Position error: [%s]" % err_pos)
        change_state(2)
    #if math.fabs(err_yaw) > yaw_error:
    #    change_state(0)

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
    rate = rospy.Rate(5)
      

    while not rospy.is_shutdown(): 
        rospy.Subscriber("lakitu", positions, callback)   
        rate.sleep()
        #if state == 0:
        #    fix_yaw(desired_position)
        #    rate.sleep()
        if state == 1:
            go_straight(desired_position)
            rate.sleep()
        elif state == 2:
            done()
            rate.sleep()
            pass
        else:
            rospy.logger("Unknown state!")
            pass
        rate.sleep()


if __name__ == '__main__':
    input("press enter:")
    main()