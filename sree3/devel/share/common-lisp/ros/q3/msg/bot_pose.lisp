; Auto-generated. Do not edit!


(cl:in-package q3-msg)


;//! \htmlinclude bot_pose.msg.html

(cl:defclass <bot_pose> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (direction
    :reader direction
    :initarg :direction
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass bot_pose (<bot_pose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bot_pose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bot_pose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name q3-msg:<bot_pose> is deprecated: use q3-msg:bot_pose instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <bot_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader q3-msg:location-val is deprecated.  Use q3-msg:location instead.")
  (location m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <bot_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader q3-msg:direction-val is deprecated.  Use q3-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bot_pose>) ostream)
  "Serializes a message object of type '<bot_pose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'direction) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bot_pose>) istream)
  "Deserializes a message object of type '<bot_pose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'direction) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bot_pose>)))
  "Returns string type for a message object of type '<bot_pose>"
  "q3/bot_pose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bot_pose)))
  "Returns string type for a message object of type 'bot_pose"
  "q3/bot_pose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bot_pose>)))
  "Returns md5sum for a message object of type '<bot_pose>"
  "7b486e5b854c9adb55fb5f9c3c07f96f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bot_pose)))
  "Returns md5sum for a message object of type 'bot_pose"
  "7b486e5b854c9adb55fb5f9c3c07f96f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bot_pose>)))
  "Returns full string definition for message of type '<bot_pose>"
  (cl:format cl:nil "geometry_msgs/Pose2D location~%std_msgs/String direction~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bot_pose)))
  "Returns full string definition for message of type 'bot_pose"
  (cl:format cl:nil "geometry_msgs/Pose2D location~%std_msgs/String direction~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bot_pose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bot_pose>))
  "Converts a ROS message object to a list"
  (cl:list 'bot_pose
    (cl:cons ':location (location msg))
    (cl:cons ':direction (direction msg))
))
