import cv2
import depthai as dai
import numpy as np

#decided to make it modular but no time L
#def monocam_lr(l):
#	mono_cam=pipeline.createMonocamera()
#	if l:
#		mono_cam.setBoardSocket(dai.CameraBoardSocket.LEFT)
#	else:
#		mono_cam.setBoardSocket(dai.CameraBoardSocket.LEFT)
#	return mono
	

pipeline=dai.Pipeline()

#setup for monocam right
monoleft=pipeline.createMonoCamera()
monoleft.setBoardSocket(dai.CameraBoardSocket.LEFT)
xoutleft=pipeline.createXLinkOut()
xoutleft.setStreamName("left")
monoleft.out.link(xoutleft.input)

#setup for monocamright
monoright=pipeline.createMonoCamera()
monoright.setBoardSocket(dai.CameraBoardSocket.RIGHT)
xoutright=pipeline.createXLinkOut()
xoutright.setStreamName("right")
monoright.out.link(xoutright.input)

#transferred  pipeline oto the cam
with dai.Device(pipeline) as device:
	leftqueue=device.getOutputQueue(name="left", maxSize=1)
	rightqueue=device.getOutputQueue(name="right", maxSize=1)
	
	#open cv window to display images
	cv2.namedWindow("Stereo cam l&r")
	#setting true for toggle option
	twoim=True
	
	#looping infinitly to fram successive frames
	while True:
		#setting up the queue
		leftframe=leftqueue.get()
		leftframe.getCvFrame()
		rightframe=rightqueue.get()
		rightframe.getCvFrame()
		
		if  twoim:
			#horizontal stacking for displaying images side by side
			imout=np.hstack((leftframe, rightframe))
		else:
			#*adding and averaging  we are passing the result of the addition and then convert to uint8 to adhere to the 8bit range*#
			imout=np.uint8(leftframe/2+rightfram/2)
			
		cv2.imshow("Stereo cam l&r", imout)
		#not 0 input here cause we dont want to wait indefinitely
		key=cv2.waitkey(1)
		
		#keycontrol press q to quit t to toggle
		if key&0xFF==ord('q'):
			break
			
		if key&0xFF==ord('t'):
			twoim= not twoim		
	#closing all cvs gui window
	cv.destroyAllWindows()
		
			
				
	
	

	
	
