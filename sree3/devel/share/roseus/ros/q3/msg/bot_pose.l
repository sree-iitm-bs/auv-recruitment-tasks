;; Auto-generated. Do not edit!


(when (boundp 'q3::bot_pose)
  (if (not (find-package "Q3"))
    (make-package "Q3"))
  (shadow 'bot_pose (find-package "Q3")))
(unless (find-package "Q3::BOT_POSE")
  (make-package "Q3::BOT_POSE"))

(in-package "ROS")
;;//! \htmlinclude bot_pose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass q3::bot_pose
  :super ros::object
  :slots (_location _direction ))

(defmethod q3::bot_pose
  (:init
   (&key
    ((:location __location) (instance geometry_msgs::Pose2D :init))
    ((:direction __direction) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _location __location)
   (setq _direction __direction)
   self)
  (:location
   (&rest __location)
   (if (keywordp (car __location))
       (send* _location __location)
     (progn
       (if __location (setq _location (car __location)))
       _location)))
  (:direction
   (&rest __direction)
   (if (keywordp (car __direction))
       (send* _direction __direction)
     (progn
       (if __direction (setq _direction (car __direction)))
       _direction)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _location
    (send _location :serialization-length)
    ;; std_msgs/String _direction
    (send _direction :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _location
       (send _location :serialize s)
     ;; std_msgs/String _direction
       (send _direction :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _location
     (send _location :deserialize buf ptr-) (incf ptr- (send _location :serialization-length))
   ;; std_msgs/String _direction
     (send _direction :deserialize buf ptr-) (incf ptr- (send _direction :serialization-length))
   ;;
   self)
  )

(setf (get q3::bot_pose :md5sum-) "7b486e5b854c9adb55fb5f9c3c07f96f")
(setf (get q3::bot_pose :datatype-) "q3/bot_pose")
(setf (get q3::bot_pose :definition-)
      "geometry_msgs/Pose2D location
std_msgs/String direction

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

================================================================================
MSG: std_msgs/String
string data

")



(provide :q3/bot_pose "7b486e5b854c9adb55fb5f9c3c07f96f")


