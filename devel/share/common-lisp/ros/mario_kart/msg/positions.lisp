; Auto-generated. Do not edit!


(cl:in-package mario_kart-msg)


;//! \htmlinclude positions.msg.html

(cl:defclass <positions> (roslisp-msg-protocol:ros-message)
  ((mario_position
    :reader mario_position
    :initarg :mario_position
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (finish_line_position
    :reader finish_line_position
    :initarg :finish_line_position
    :type geometry_msgs-msg:PoseStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PoseStamped))
   (items_position
    :reader items_position
    :initarg :items_position
    :type (cl:vector geometry_msgs-msg:PoseStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PoseStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PoseStamped))))
)

(cl:defclass positions (<positions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <positions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'positions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mario_kart-msg:<positions> is deprecated: use mario_kart-msg:positions instead.")))

(cl:ensure-generic-function 'mario_position-val :lambda-list '(m))
(cl:defmethod mario_position-val ((m <positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mario_kart-msg:mario_position-val is deprecated.  Use mario_kart-msg:mario_position instead.")
  (mario_position m))

(cl:ensure-generic-function 'finish_line_position-val :lambda-list '(m))
(cl:defmethod finish_line_position-val ((m <positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mario_kart-msg:finish_line_position-val is deprecated.  Use mario_kart-msg:finish_line_position instead.")
  (finish_line_position m))

(cl:ensure-generic-function 'items_position-val :lambda-list '(m))
(cl:defmethod items_position-val ((m <positions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mario_kart-msg:items_position-val is deprecated.  Use mario_kart-msg:items_position instead.")
  (items_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <positions>) ostream)
  "Serializes a message object of type '<positions>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mario_position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'finish_line_position) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'items_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'items_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <positions>) istream)
  "Deserializes a message object of type '<positions>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mario_position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'finish_line_position) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'items_position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'items_position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PoseStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<positions>)))
  "Returns string type for a message object of type '<positions>"
  "mario_kart/positions")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'positions)))
  "Returns string type for a message object of type 'positions"
  "mario_kart/positions")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<positions>)))
  "Returns md5sum for a message object of type '<positions>"
  "ab5c42f6f1d9f4787a44e116dc918f16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'positions)))
  "Returns md5sum for a message object of type 'positions"
  "ab5c42f6f1d9f4787a44e116dc918f16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<positions>)))
  "Returns full string definition for message of type '<positions>"
  (cl:format cl:nil "geometry_msgs/PoseStamped mario_position~%geometry_msgs/PoseStamped finish_line_position~%geometry_msgs/PoseStamped[] items_position~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'positions)))
  "Returns full string definition for message of type 'positions"
  (cl:format cl:nil "geometry_msgs/PoseStamped mario_position~%geometry_msgs/PoseStamped finish_line_position~%geometry_msgs/PoseStamped[] items_position~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <positions>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mario_position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'finish_line_position))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'items_position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <positions>))
  "Converts a ROS message object to a list"
  (cl:list 'positions
    (cl:cons ':mario_position (mario_position msg))
    (cl:cons ':finish_line_position (finish_line_position msg))
    (cl:cons ':items_position (items_position msg))
))
