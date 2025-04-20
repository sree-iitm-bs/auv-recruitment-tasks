#!/usr/bin/python3

#importing all requierd libraries
import rospy
import time
from datetime import datetime

#*since we work with only basic datatypes this library is sufficient, but there are other libraries like geometric_msgs, nav_etc etc for sending special datatypes like spatial variables, path planning vars etc*#

#*types are defined as .msg files and std_msgs contians predefined types we can create a new datatype by creating a new dmsg file*#
from std_msgs.msg import String

# a ros node can be both a publisher and a subscriber to the same topic, this is used in looping, feedback etc. where a node publishes some data and subscribes to it to process it for further evaluation. 

#registering the script as a ros node, give anonymous for assuring uniquness of a node
rospy.init_node("ansforq1", anonymous=True)
rospy.loginfo("ansforq1 node started serving")

#open convo file in append mode
convo_file=open("conversation.txt", "a")
flag=0
def convo(data):
	global flag
	if flag==0:
		reply=input("Jolyne:")
		ans=String()
		ans.data=reply
		flag=1
		push=f"Jolyne:{ans.data}"
		convo_file.write(push+"\n")
		pub.publish(ans)
	else:
		reply=input("Joestar:")
		ans=String()
		ans.data=reply
		flag=0
		push=f"Joestar:{ans.data}"
		convo_file.write(push+"\n")
		rospy.loginfo(f"{ans.data}")
		pub.publish(ans)
	

	
#* instance of subscriber object, gets String values from topic pipe1 , calls the function convo after receiving String, we do not give convo() in the input so it wont get called instantaneously*#
sub=rospy.Subscriber('jojo',String, convo)
#*one node acting as pub and sub on same topic for feedbacks if acting as pub and sub on different topic then can be used as mediator, intermediate processor scripts etc.*#
pub=rospy.Publisher('jojo', String, queue_size=10)

# we can only start the convo with joestar speaking as he the old man
starter=input("Joestar:")

init=String()
init.data=starter
rospy.loginfo(f"{init.data}")
rospy.sleep(1)

#logging start date and time of convo
current=f"convo start:{datetime.now()}"
convo_file.write(current+"\n")
pub.publish(init)
#pause for 1sec so message is processed completely
rospy.sleep(1)


	
#keeps node alive and waiting for callbacks
rospy.spin()
convo_file.close()



