#!/usr/bin/python3

#importing all requierd libraries
import rospy 

#*since we work with only basic datatypes this library is sufficient, but there are other libraries like geometric_msgs, nav_etc etc for sending special datatypes like spatial variables, path planning vars etc*#

#*types are defined as .msg files and std_msgs contians predefined types we can create a new datatype by creating a new dmsg file*#
from std_msgs.msg import Int64

#registering the script as a ros node, give anonymous for assuring uniquness of a node
rospy.init_node("pub", anonymous=True)

#* instance of publisher object, publishes Int64 values to topic pipe1 , when subscriber process data at a slower rate the excess data is stored in the buffer of that topic queuesize defines the max buffer size, if more new messages come in the old data in the buffer will be removed
pub=rospy.Publisher("pipe1",Int64 ,queue_size=5)

#open an input file in write mode
infile=open("input.txt", "w")

# to control frequency of loop input is in hertz
rate=rospy.Rate(0.2)

rospy.loginfo("pub node started serving")

i=0
#returns false if node is shut down 
while not rospy.is_shutdown():
	# msg is instance of the .msg included in the header package
	msg=Int64()
	#msg=Int64(i) is not valid syntax
	msg.data=i
	rospy.loginfo(f"publishing {msg.data} to topic pipe1")
	
	#writing to the input file
	reply=f"publishing {msg.data} to topic pipe1"
	infile.write(reply+"\n")
	pub.publish(msg)
	i=i+2
	#*adjusts sleep duration based on how much time is elapsed to run the code in the loop block to adhere 	    to rospy.rate() here there is no need for rospy.sleep() we control exec speed using the rate object*#
	rate.sleep()

	







