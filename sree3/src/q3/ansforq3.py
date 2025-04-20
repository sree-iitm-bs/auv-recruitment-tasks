#!/usr/bin/python3

#all required imports
import rospy
from q3.msg import bot_pose as bp
from std_msgs.msg import String
import math

#node initialisations
rospy.init_node("q3", anonymous=True)
rospy.loginfo("q3 node is serving")

#setting up the publisher
pub=rospy.Publisher("pipe1", bp, queue_size=5)

rate=rospy.Rate(0.2)

#initialising our custom message
coord=bp()
coord.location.x=0
coord.location.y=0
coord.location.theta=0
coord.direction.data="null"

while not rospy.is_shutdown():
	#getting command from the user
	inp=input("Enter a command:")
	inpf=inp.lower()
	#depending on the condition the corresponsing updates are done
	if inp=="forward":
		coord.location.y+=1
		mag=(coord.location.x*coord.location.x)+(coord.location.y*coord.location.y)
		mag=math.sqrt(mag)
		coord.location.theta=math.atan2(coord.location.y, coord.location.x)
		coord.direction.data="north"
		
	elif inp=="backward":
		coord.location.y-=1
		mag=(coord.location.x*coord.location.x)+(coord.location.y*coord.location.y)
		mag=math.sqrt(mag)
		coord.location.theta=math.atan2(coord.location.y, coord.location.x)
		coord.direction.data="south"
		
	elif inp=="right":
		coord.location.x+=1
		mag=(coord.location.x*coord.location.x)+(coord.location.y*coord.location.y)
		mag=math.sqrt(mag)
		coord.location.theta=math.atan2(coord.location.y, coord.location.x)
		coord.direction.data="east"
		
	elif inp=="left":
		coord.location.x-=1
		mag=(coord.location.x*coord.location.x)+(coord.location.y*coord.location.y)
		mag=math.sqrt(mag)
		coord.location.theta=math.atan2(coord.location.y, coord.location.x)
		coord.direction.data="west"
	else:
		rospy.loginfo("not a valid command")
		
	
	rospy.loginfo("Publishing a bp obejct")
	pub.publish(coord)
	rate.sleep()
	
