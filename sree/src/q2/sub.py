#!/usr/bin/python3

#importing all requierd libraries
import rospy 

#*since we work with only basic datatypes this library is sufficient, but there are other libraries like geometric_msgs, nav_etc etc for sending special datatypes like spatial variables, path planning vars etc*#

#*types are defined as .msg files and std_msgs contians predefined types we can create a new datatype by creating a new dmsg file*#
from std_msgs.msg import Int64

#registering the script as a ros node, give anonymous for assuring uniquness of a node
rospy.init_node("sub", anonymous=True)
rospy.loginfo("sub node started serving")

#open output.txt in write mode
out=open("output.txt", "w")

def add5f(data):
	#Int64 instance for holding the result
	ans=Int64()
	ans.data=data.data+5
	#formatted string
	rospy.loginfo(f"Final output {ans.data}")
	reply=f"Final output {ans.data}"
	out.write(reply)
	
	
#* instance of subscriber object, gets Int64 values from topic pipe2 , calls the function add5f after receiving Int64, we do not give add5f() in the input so it wont get called instantaneously*#
sub=rospy.Subscriber('pipe2',Int64, add5f)

#keeps node alive and waiting for callbacks
rospy.spin()
#closing our ouput file
out.close()

