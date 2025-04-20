
(cl:in-package :asdf)

(defsystem "q3-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "bot_pose" :depends-on ("_package_bot_pose"))
    (:file "_package_bot_pose" :depends-on ("_package"))
    (:file "fsm_custom" :depends-on ("_package_fsm_custom"))
    (:file "_package_fsm_custom" :depends-on ("_package"))
  ))