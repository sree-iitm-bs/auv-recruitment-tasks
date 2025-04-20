#!/usr/bin/python3

import rospy
#importing the custom message we built
from q3.msg import bot_pose as bp
from std_msgs.msg import String
import math

#initialising nodes
rospy.init_node("q3out", anonymous=True)
rospy.loginfo("q3out node is serving")

#open files in write mode
out=open("out.txt", "w")

#callback for the sub
def callback(bot_pose):
	rospy.loginfo(f"bot({bot_pose.location.x}, {bot_pose.location.y}, {bot_pose.location.theta}, {bot_pose.direction.data})")
	reply=f"bot({bot_pose.location.x}, {bot_pose.location.y}, {bot_pose.location.theta}, {bot_pose.direction.data})"
	out.write(reply+"\n")
	
#subscriber initliasations
sub=rospy.Subscriber("pipe1", bp, callback)

#wait for next bot_pose message
rospy.spin()

#close file
out.close()




	
