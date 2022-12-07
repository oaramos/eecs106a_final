;; Auto-generated. Do not edit!


(when (boundp 'mario_kart::positions)
  (if (not (find-package "MARIO_KART"))
    (make-package "MARIO_KART"))
  (shadow 'positions (find-package "MARIO_KART")))
(unless (find-package "MARIO_KART::POSITIONS")
  (make-package "MARIO_KART::POSITIONS"))

(in-package "ROS")
;;//! \htmlinclude positions.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mario_kart::positions
  :super ros::object
  :slots (_mario_position _finish_line_position _items_position ))

(defmethod mario_kart::positions
  (:init
   (&key
    ((:mario_position __mario_position) (instance geometry_msgs::PoseStamped :init))
    ((:finish_line_position __finish_line_position) (instance geometry_msgs::PoseStamped :init))
    ((:items_position __items_position) ())
    )
   (send-super :init)
   (setq _mario_position __mario_position)
   (setq _finish_line_position __finish_line_position)
   (setq _items_position __items_position)
   self)
  (:mario_position
   (&rest __mario_position)
   (if (keywordp (car __mario_position))
       (send* _mario_position __mario_position)
     (progn
       (if __mario_position (setq _mario_position (car __mario_position)))
       _mario_position)))
  (:finish_line_position
   (&rest __finish_line_position)
   (if (keywordp (car __finish_line_position))
       (send* _finish_line_position __finish_line_position)
     (progn
       (if __finish_line_position (setq _finish_line_position (car __finish_line_position)))
       _finish_line_position)))
  (:items_position
   (&rest __items_position)
   (if (keywordp (car __items_position))
       (send* _items_position __items_position)
     (progn
       (if __items_position (setq _items_position (car __items_position)))
       _items_position)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _mario_position
    (send _mario_position :serialization-length)
    ;; geometry_msgs/PoseStamped _finish_line_position
    (send _finish_line_position :serialization-length)
    ;; geometry_msgs/PoseStamped[] _items_position
    (apply #'+ (send-all _items_position :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _mario_position
       (send _mario_position :serialize s)
     ;; geometry_msgs/PoseStamped _finish_line_position
       (send _finish_line_position :serialize s)
     ;; geometry_msgs/PoseStamped[] _items_position
     (write-long (length _items_position) s)
     (dolist (elem _items_position)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _mario_position
     (send _mario_position :deserialize buf ptr-) (incf ptr- (send _mario_position :serialization-length))
   ;; geometry_msgs/PoseStamped _finish_line_position
     (send _finish_line_position :deserialize buf ptr-) (incf ptr- (send _finish_line_position :serialization-length))
   ;; geometry_msgs/PoseStamped[] _items_position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _items_position (let (r) (dotimes (i n) (push (instance geometry_msgs::PoseStamped :init) r)) r))
     (dolist (elem- _items_position)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get mario_kart::positions :md5sum-) "ab5c42f6f1d9f4787a44e116dc918f16")
(setf (get mario_kart::positions :datatype-) "mario_kart/positions")
(setf (get mario_kart::positions :definition-)
      "geometry_msgs/PoseStamped mario_position
geometry_msgs/PoseStamped finish_line_position
geometry_msgs/PoseStamped[] items_position

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :mario_kart/positions "ab5c42f6f1d9f4787a44e116dc918f16")


