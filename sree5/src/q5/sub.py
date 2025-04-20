#!/usr/bin/python3

import rospy

# we are using the image datatype has (stamp, fram_id, rgb8, mono8, rgba8,mono16, rbg16)
from sensor_msgs.msg import Image

#cv_bridge is used for converting opencv images to a ros image message and vice versa
from cv_bridge import CvBridge 

import cv2
import numpy as np
import depthai as dai


#registering the script as a ros node, give anonymous for assuring uniquness of a node
rospy.init_node("sub", anonymous=True)
rospy.loginfo("sub node started serving")

#open files in write mode
out=open("out.txt", "w")

bridge=CvBridge()

def callbackcanny(data):
	#*getting the timestamp; ;later learnt that : in timestamp may prevent files from getting created so came up with a solution*#
	t=data.header.stamp
	timestamp=f"{t.secs}_{t.nsecs}"
	#back conversion for storing it as .png
	cvimage=bridge.imgmsg_to_cv2(data, desired_encoding="passthrough")
	#filepath
	filepath=f"./canny_{timestamp}.png"
	#storing image
	cv2.imwrite(filepath, cvimage)
	
	rospy.loginfo(f"Canny result stored at{timestamp}")
	reply=f"Canny result stored at{timestamp}"
	out.write(reply+"\n")
	
def callbacksobel(data):
	#getting the timestamp
	t=data.header.stamp
	timestamp=f"{t.secs}_{t.nsecs}"
	#back conversion for storing it as .png
	cvimage=bridge.imgmsg_to_cv2(data, desired_encoding="passthrough")
	#filepath
	filepath=f"./sobel_{timestamp}.png"
	#storing image
	cv2.imwrite(filepath, cvimage)
	
	rospy.loginfo(f"Sobel result stored at{timestamp}")
	reply=f"Sobel result stored at{timestamp}"
	out.write(reply+"\n")	
	
	
#initialising the subscibers 
subcanny=rospy.Subscriber('canny',Image, callbackcanny)
subsobel=rospy.Subscriber('sobel',Image, callbacksobel)


#keeps node alive and waiting for callbacks
rospy.spin()
#closing our ouput file
out.close()
