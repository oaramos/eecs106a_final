#! /usr/bin/env python

import rospy

from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import time
pub = None

def callback_laser(msg):
    #length of range data from LaserScan 
    idx = len(msg.ranges) // 5
    idx2 = idx+idx 
    idx3 = idx2+idx 
    idx4 = idx3+idx
    idx5 = idx4+idx
    #print(f"laser_scans:{msg.ranges}")
    #print((msg.ranges))
   
    regions = {
        'right' : min([x for x in msg.ranges[0:idx-1] if x!=0.0]),
        'fright': min([x for x in msg.ranges[idx:idx2-1] if x!=0.0]),
        'front' : min([x for x in msg.ranges[idx2:idx3-1] if x!=0.0]),
        'fleft' : min([x for x in msg.ranges[idx3:idx4-1] if x!=0.0]), 
        'left'  : min([x for x in msg.ranges[idx4:idx5-1] if x!=0.0])
    }
    #rospy.loginfo(msg)
    print(msg.range_min)
    take_action(regions)

def take_action(regions):
    msg = Twist()
    linear_x = 0
    angular_z = 0
    
    state_description = ''
    d = 0.5
    if regions['front'] > d and regions['fleft'] > d and regions['fright'] > d:
        state_description = 'case  - nothing'
        linear_x = 0.2
        angular_z = 0
    elif regions['front'] < d and regions['fleft'] > d and regions['fright'] > d:
        state_description = 'case 2 - front'
        linear_x = 0
        angular_z = 0.2
    elif regions['front'] > d and regions['fleft'] > d and regions['fright'] < d:
        state_description = 'case 3 - fright'
        linear_x = 0
        angular_z = 0.2
    elif regions['front'] > d and regions['fleft'] < d and regions['fright'] > d:
        state_description = 'case 4 - fleft'
        linear_x = 0
        angular_z = -0.2
    elif regions['front'] < d and regions['fleft'] > d and regions['fright'] < d:
        state_description = 'case 5 - front and fright'
        linear_x = 0
        angular_z = 0.2
    elif regions['front'] < d and regions['fleft'] < d and regions['fright'] > d:
        state_description = 'case 6 - front and fleft'
        linear_x = 0
        angular_z = -0.2
    elif regions['front'] < d and regions['fleft'] < d and regions['fright'] < d:
        state_description = 'case 7 - front and fleft and fright'
        linear_x = 0
        angular_z = 0.2
    elif regions['front'] > d and regions['fleft'] < d and regions['fright'] < d:
        state_description = 'case 8 - fleft and fright'
        linear_x = 0.2
        angular_z = 0
    else:
        state_description = 'unknown case'
        #rospy.loginfo(regions)

    #rospy.loginfo(state_description)
    msg.linear.x = linear_x
    msg.angular.z = angular_z
    pub.publish(msg)



    
def main():
    global pub
    
    rospy.init_node('reading_laser')
    
    pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    
    rospy.Subscriber('/scan', LaserScan, callback_laser)
    
    rospy.spin()

if __name__ == '__main__':
    main()
