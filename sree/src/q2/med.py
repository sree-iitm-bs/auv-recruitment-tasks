#!/usr/bin/python3

#importing all requierd libraries
import rospy 

#*since we work with only basic datatypes this library is sufficient, but there are other libraries like geometric_msgs, nav_etc etc for sending special datatypes like spatial variables, path planning vars etc*#

#*types are defined as .msg files and std_msgs contians predefined types we can create a new datatype by creating a new dmsg file*#
from std_msgs.msg import Int64

#registering the script as a ros node, give anonymous for assuring uniquness of a node
rospy.init_node("med", anonymous=True)
rospy.loginfo("med node started serving")

def multiply10(data):
	#Int64 instance for holding the result
	ans=Int64()
	ans.data=data.data*10
	#formatted string
	rospy.loginfo(f"Publishing {data.data} to topic pipe2")
	pub.publish(ans)
	
#* instance of subscriber object, gets Int64 values from topic pipe1 , calls the function multiply10 after receiving Int64, we do not give multiply10() in the input so it wont get called instantaneously*#
sub=rospy.Subscriber('pipe1',Int64, multiply10)
pub=rospy.Publisher('pipe2', Int64, queue_size=10)
#keeps node alive and waiting for callbacks
rospy.spin()







	
