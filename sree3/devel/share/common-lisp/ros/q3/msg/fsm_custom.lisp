; Auto-generated. Do not edit!


(cl:in-package q3-msg)


;//! \htmlinclude fsm_custom.msg.html

(cl:defclass <fsm_custom> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (y
    :reader y
    :initarg :y
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (z
    :reader z
    :initarg :z
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (direction
    :reader direction
    :initarg :direction
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass fsm_custom (<fsm_custom>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <fsm_custom>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'fsm_custom)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name q3-msg:<fsm_custom> is deprecated: use q3-msg:fsm_custom instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <fsm_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader q3-msg:x-val is deprecated.  Use q3-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <fsm_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader q3-msg:y-val is deprecated.  Use q3-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <fsm_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader q3-msg:z-val is deprecated.  Use q3-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <fsm_custom>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader q3-msg:direction-val is deprecated.  Use q3-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <fsm_custom>) ostream)
  "Serializes a message object of type '<fsm_custom>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'x) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'y) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'z) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'direction) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <fsm_custom>) istream)
  "Deserializes a message object of type '<fsm_custom>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'x) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'y) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'z) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'direction) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<fsm_custom>)))
  "Returns string type for a message object of type '<fsm_custom>"
  "q3/fsm_custom")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'fsm_custom)))
  "Returns string type for a message object of type 'fsm_custom"
  "q3/fsm_custom")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<fsm_custom>)))
  "Returns md5sum for a message object of type '<fsm_custom>"
  "7f272c4a41ba10e634ae3cc108268d35")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'fsm_custom)))
  "Returns md5sum for a message object of type 'fsm_custom"
  "7f272c4a41ba10e634ae3cc108268d35")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<fsm_custom>)))
  "Returns full string definition for message of type '<fsm_custom>"
  (cl:format cl:nil "std_msgs/Float64 x~%std_msgs/Float64 y~%std_msgs/Float64 z~%std_msgs/String direction~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'fsm_custom)))
  "Returns full string definition for message of type 'fsm_custom"
  (cl:format cl:nil "std_msgs/Float64 x~%std_msgs/Float64 y~%std_msgs/Float64 z~%std_msgs/String direction~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <fsm_custom>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'x))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'y))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'z))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <fsm_custom>))
  "Converts a ROS message object to a list"
  (cl:list 'fsm_custom
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':direction (direction msg))
))
