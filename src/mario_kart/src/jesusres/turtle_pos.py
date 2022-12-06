#! /usr/bin/env python

from tf import TransformBroadcaster
import rospy
from rospy import Time

def main():
	rospy.init_node("name")

	b = TransformBroadcaster()

	translation = (0.0, 0.0, 0.0)
	rotation = (0.0, 0.0, 0.0, 1.0)
	rate = rospy.Rate(5)

	, time, child, parent

	while not rospy.is_shutdown():
		b.sendTransform(translation, rotation, Time.now(), "ignite_robot", '/world')
		rate,sleep()


if __name__ == '__main__':
	main()

	"https://www.theconstructsim.com/publish-position-robot-using-transformbroadcaster-python/"