import depthai as dai
import cv2


monopipe=dai.Pipeline()
#we have established that there is a mono cam in oak-d; created a node
mono=monopipe.createMonoCamera()
#*specify that the above node is for the left mono cam; creates a xlink node internally; this helps the cam connect to our system; xlinkin->input to cam; xlinkout->output from the cam*#
mono.setBoardSocket(dai.CameraBoardSocketdLEFT)

#create xlinkout and name it monoleft 
xout_mono=monopipe.createXLinkOut()
xout_mono.setStreamName("monoleft")
#taking output of monoleft cam and putting it as input to xlinkout thereby establishing a connection
mono.out.link(xout_mono.input)

#with this line we transfer the pipeline onto the device so we can query it
with dai.Device(monopipe) as device:
	#defaulting the queue
	queue=device.getOutputQueue(name="left")
	#querying queue for xlink out
	frame=queue.get()
	#converts to open cv format
	imout=frame.getCvFrame()
	cv2.imshow("Image",imout)
	#*waits for a keypress we then bitwise and to get the ascii value of the key pressed; if equal to ascii of q breaks the loop*#
	ifcv2.waitKey(0)&0xFF==ord('q'):
		break


#initialising pipeline the main structure where we define all nodes
pipeline=dai.Pipeline()

#creating camera node in the pipeline, this captures the color images
colorcam=pipeline.createColorCamera()

#setting 30fps
colorcam.setFps(30) 
# setting the resolution as 720p
colocam.setResolution(dai.ColorCameraProperties.SensorResolution.THE_720_P) 
  
# using rgb socket in oak
colorcam.setBoardSocket(dai.CameraBoardSocket.RGB)
#true interleaved format; false non interleaved format cv2 easier to han,le non interleaved
colorcam.setInterleaved(False)  

# Create an xlink output node to stream from the cam to our system
xout_colorcam=pipeline.createXLinkOut()
#naming the output stream created above
xout_colorcam.setStreamName("colorcam")
colorcam.out.link(xout_colorcam.input)

with dai.Device(pipeline) as device:
	rbgqueue=device.getOutputQueue(name="rgbvid", maxSize=4)
	inp=rbgqueue.get()
	frame=inp.getCvFrame()
	cv2.imshow("rbg", frame)
	#*waits for a keypress we then bitwise and(bitmask) to get the ascii value of the key pressed; if equal to ascii of q breaks the loop*#
	if cv2.waitKey(0)&0xFF==ord('q'):
		break
		
#closes all gui windows opened by cv2.imshow()
cv2.destroyAllWindows()

