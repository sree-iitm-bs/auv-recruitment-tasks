;; Auto-generated. Do not edit!


(when (boundp 'q3::fsm_custom)
  (if (not (find-package "Q3"))
    (make-package "Q3"))
  (shadow 'fsm_custom (find-package "Q3")))
(unless (find-package "Q3::FSM_CUSTOM")
  (make-package "Q3::FSM_CUSTOM"))

(in-package "ROS")
;;//! \htmlinclude fsm_custom.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass q3::fsm_custom
  :super ros::object
  :slots (_x _y _z _direction ))

(defmethod q3::fsm_custom
  (:init
   (&key
    ((:x __x) (instance std_msgs::Float64 :init))
    ((:y __y) (instance std_msgs::Float64 :init))
    ((:z __z) (instance std_msgs::Float64 :init))
    ((:direction __direction) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _x __x)
   (setq _y __y)
   (setq _z __z)
   (setq _direction __direction)
   self)
  (:x
   (&rest __x)
   (if (keywordp (car __x))
       (send* _x __x)
     (progn
       (if __x (setq _x (car __x)))
       _x)))
  (:y
   (&rest __y)
   (if (keywordp (car __y))
       (send* _y __y)
     (progn
       (if __y (setq _y (car __y)))
       _y)))
  (:z
   (&rest __z)
   (if (keywordp (car __z))
       (send* _z __z)
     (progn
       (if __z (setq _z (car __z)))
       _z)))
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
    ;; std_msgs/Float64 _x
    (send _x :serialization-length)
    ;; std_msgs/Float64 _y
    (send _y :serialization-length)
    ;; std_msgs/Float64 _z
    (send _z :serialization-length)
    ;; std_msgs/String _direction
    (send _direction :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float64 _x
       (send _x :serialize s)
     ;; std_msgs/Float64 _y
       (send _y :serialize s)
     ;; std_msgs/Float64 _z
       (send _z :serialize s)
     ;; std_msgs/String _direction
       (send _direction :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float64 _x
     (send _x :deserialize buf ptr-) (incf ptr- (send _x :serialization-length))
   ;; std_msgs/Float64 _y
     (send _y :deserialize buf ptr-) (incf ptr- (send _y :serialization-length))
   ;; std_msgs/Float64 _z
     (send _z :deserialize buf ptr-) (incf ptr- (send _z :serialization-length))
   ;; std_msgs/String _direction
     (send _direction :deserialize buf ptr-) (incf ptr- (send _direction :serialization-length))
   ;;
   self)
  )

(setf (get q3::fsm_custom :md5sum-) "7f272c4a41ba10e634ae3cc108268d35")
(setf (get q3::fsm_custom :datatype-) "q3/fsm_custom")
(setf (get q3::fsm_custom :definition-)
      "std_msgs/Float64 x
std_msgs/Float64 y
std_msgs/Float64 z
std_msgs/String direction

================================================================================
MSG: std_msgs/Float64
float64 data
================================================================================
MSG: std_msgs/String
string data

")



(provide :q3/fsm_custom "7f272c4a41ba10e634ae3cc108268d35")


