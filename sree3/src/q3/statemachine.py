#decided to incorporate state machine 
#im making this as a feedback node as by pub is written for pushing it to a file
#wanted to properly calculate thetha for 3d but later realised i gave direction i my custom msg as String type so for now ill just put some string*#
import rospy
#importing the custom message we built
from q3.msg import fsm_custom as fm
from std_msgs.msg import String
import math
#required imports for state machine
from statemachine import StateMachine
from statemachine import State

#*bot starts at (0,0) and we are modeling it as a fsm it has finite no of states and transitions defined between those;  event (cli input) from user causes transitions which result in action

#*defining our fsm ; assume its in +x axis direction(set initial as True) and at rest as some initial entry is required inour fsm*#

#inherits the StateMachine class
class botloc(StateMachine):
	#creating the required states and assign to the variables for manipulation
	idle=State('idle', initial=True)
	surge=State('surge')
	sway=State('sway')
	heave=State('heave')
	
	#defining the transitions and chaining it using bitwise or ;to() is inherited from the parent class
	movx=(idle.to(surge)
	           | surge.to(idle) 	
	           )
	           
	movy=(idle.to(sway)
	           | sway.to(idle) 	
	           ) 
	             
	movz=(idle.to(heave)
	           | heave.to(idle) 	
	           )                          
	#these functions triggered when exiting the state        
	def on_exit_surge(self):
		pass
	def on_exit_sway(self):
		pass
	def on_exit_heave(self):
		pass
	def on_exit_idle(self):
		pass
		
	#triggered when entering the state
	def on_enter_surge(self):
		rospy.loginfo("bot surge")
	def on_enter_sway(self):
		rospy.loginfo("bot sway")
	def on_enter_heave(self):
		rospy.loginfo("bot heave")
	def on_enter_idle(self):
		rospy.loginfo("bot idle")
    
	
#initialising nodes
rospy.init_node("q3fsm", anonymous=True)
rospy.loginfo("q3fsm node is serving")

#initialising our custom datatype defined
coord=fm()
coord.x.data=0
coord.y.data=0
coord.z.data=0
coord.direction.data="null"

#instance of our very small and basic fsm
botlocinst=botloc()

#opening a file in write mode for logging puposes
out=open("output.txt", "w")

#*function to manipulate the user inputs; depending on their inputs we move to different states although there only few states by the method mov(); a movement will make the bot move 5 units*#
def move(inp):
	#coord and our fsm instance are global in our script
	global botlocinst
	global coord
	
	#depending on user input 5 units moved in the corresponding direction	
	if inp.lower()=="forward":
		#triggering a transition by method movx()
		botlocinst.movx()
		for i in range(0,5):
			coord.x.data=coord.x.data+1
			rospy.loginfo(f"position: ({coord.x.data},{coord.y.data},{coord.z.data})")
		
		coord.direction.data="bot moving away from origin"
		botlocinst.movx()
		
	elif inp.lower()=="backward":
		botlocinst.movx()
		for i in range(0,5):
			coord.x.data=coord.x.data-1
			rospy.loginfo(f"position: ({coord.x.data},{coord.y.data},{coord.z.data})")
		
		coord.direction.data="bot moving towards origin"
		botlocinst.movx()
			
	elif inp.lower()=="right":
		botlocinst.movy()
		for i in range(0,5):
			coord.y.data=coord.y.data+1
			rospy.loginfo(f"position: ({coord.x.data},{coord.y.data},{coord.z.data})")
		
		coord.direction.data="bot moving away from origin"
		botlocinst.movy()	
	
	elif inp.lower()=="left":
		botlocinst.movy()
		for i in range(0,5):
			coord.y.data=coord.y.data-1
			rospy.loginfo(f"position: ({coord.x.data},{coord.y.data},{coord.z.data})")
			
		coord.direction.data="bot moving towards origin"
		botlocinst.movy()	
	
	elif inp.lower()=="up":
		botlocinst.movz()
		for i in range(0,5):
			coord.z.data=coord.z.data+1
			rospy.loginfo(f"position: ({coord.x.data},{coord.y.data},{coord.z.data})")
		
		coord.direction.data="bot moving away from origin"
		botlocinst.movz()
	
	elif inp.lower()=="down":
		botlocinst.movz()
		for i in range(0,5):
			coord.z.data=coord.z.data-1
			rospy.loginfo(f"position: ({coord.x.data},{coord.y.data},{coord.z.data})")
		
		coord.direction.data="bot moving towards origin"
		botlocinst.movz()	
	else:
		rospy.loginfo("Invalid comment was entered")
		
	pub.publish(coord)

#callback function for the suscriber
def callback(inp):
	rospy.loginfo(f"after a process bot is at ({inp.x.data},{inp.y.data},{inp.z.data})")
	reply=f"after a process bot is at ({inp.x.data},{inp.y.data},{inp.z.data})"
	out.write(reply+"\n")
	
		
	
#subscriber  and publisher initliasations
pub=rospy.Publisher("fsm", fm, queue_size=10)
sub=rospy.Subscriber("fsm", fm, callback)
rate=rospy.Rate(0.2)

while not rospy.is_shutdown():
	userinput=input("Enter command:")
	move(userinput)
	#loop control refers rate for sleep duration
	rospy.sleep()
#*for better management of closing the file learn i cant use on shutdown hook logic; ie the shutdown_hook or any other input function is called once before closing*#
#out.close()
def shutdown_hook():
    out.close()
    rospy.loginfo("q3fsm node not serving")

rospy.on_shutdown(shutdown_hook)








