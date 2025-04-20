#!/usr/bin/python3

import rospy

# we are using the image datatype has (stamp, fram_id, rgb8, mono8, rgba8,mono16, rbg16)
from sensor_msgs.msg import Image

#cv_bridge is used for converting opencv images to a ros image message and vice versa
from cv_bridge import CvBridge 

import cv2
import numpy as np
import depthai as dai

#creating a pipeline
pipeline = dai.Pipeline()

# rgb cam node for the oak-d i choose to use the rbg cam of oakd cause for me monocams i associated them with depth i mean we can use them too but yea
cam=pipeline.createColorCamera()

#setting the resolution and fps
cam.setResolution(dai.ColorCameraProperties.SensorResolution.THE_720_P) 
cam.setFps(30) 
cam.setBoardSocket(dai.CameraBoardSocket.RGB)
#non interleaved format better for opencv
cam.setInterleaved(False)  

#creating a xoutlink and giving cam output as its input
xout_cam=pipeline.createXLinkOut()
xout_cam.setStreamName("cam")
cam.out.link(xout_cam.input)

rospy.init_node("pub", anonymous=True)
pubcanny=rospy.Publisher("canny",Image ,queue_size=5)
pubsobel=rospy.Publisher("sobel",Image ,queue_size=5)
#rate=rospy.Rate(1)

#creating an instance of the bridge object to help in conversion of messages
bridge=CvBridge()


with dai.Device(pipeline) as device:
	#*Output queue for video frames blocking will wait until new data is available program will not continue until new data is available*#
	queue = device.getOutputQueue(name="cam", maxSize=30, blocking=False)
        i=0
	
  	while not rospy.is_shutdown():
  		#getting the frame
  		inp=queue.get()
  		#cv rea,able format
  		frame=inp.getCvFrame()
  		
  		#*this function is used to convert images between different color formats; cv2.COLOR_BGR2GRAY specificies the conversion type; remember cv2 is bgr than rbg; we need grayscale images to apply the gaussian filter*# 
  		grayscale=cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
  		#*can scale the images if needed using frame.scale to obtain info about height and width and cv.resize()*#  
  	
  		#*blurring for better canny edge detection; giving kernel as a 5x5 matrix; sigmax is 0 so thatstd deviation is calculated autmatically for the gaussian distribution*#
  		blur=cv2.GaussianBlur(grayscale, (5,5), 0)
  	
  		#100 and 200 are the min and max threshold ; putting random threshold 50 and 150
    		cannyresult=cv2.Canny(blur, 50, 150) 
    	
    		#*in sobel method the resultant can be negative ; here we declared resultant type as 16-bit signed setting dx=1 and dy=1*#
    		sobelresult=cv2.Sobel(grayscale,  cv2.CV_16S, 1, 1)
    		#converting to 8-bit as well we are ,oing image processing
    		sobelfinal=np.uint8(np.absolute(sobelresult))
    	
    		rospy.loginfo("Publishing Image")
    		#convert to cv2 form to ros message form
    		transmitcanny=bridge.cv2_to_imgmsg(cannyresult, encoding="mono8")
    		transmitsobel=bridge.cv2_to_imgmsg(sobelfinal, encoding="mono8")
    		#publishing
    		pubcanny.publish(transmitcanny)
    		pubsobel.publish(transmitsobel)
    		rospy.loginfo("Completed Publishing")
    	
    		#combined display 
    		combined=np.hstack((cannyresult, sobelfinal))
    		cv2.imshow("edge detection", combined)
    	
    		#not really necessary but might cook the cpu
    		rospy.sleep(5)
    		i=i+1
    	
    		#*condition to break after 10 iterations not necessary but without knowing what to do with processed image didnt want to waste computing power*#
    		if(i==10):
    			break
    
    	
    	
    	
    	
  
    

    
     
     

    	cv2.destroyAllWindows()




