;; Auto-generated. Do not edit!


(when (boundp 'mario_kart::item)
  (if (not (find-package "MARIO_KART"))
    (make-package "MARIO_KART"))
  (shadow 'item (find-package "MARIO_KART")))
(unless (find-package "MARIO_KART::ITEM")
  (make-package "MARIO_KART::ITEM"))
(unless (find-package "MARIO_KART::ITEMREQUEST")
  (make-package "MARIO_KART::ITEMREQUEST"))
(unless (find-package "MARIO_KART::ITEMRESPONSE")
  (make-package "MARIO_KART::ITEMRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mario_kart::itemRequest
  :super ros::object
  :slots (_vel _omega ))

(defmethod mario_kart::itemRequest
  (:init
   (&key
    ((:vel __vel) 0.0)
    ((:omega __omega) 0.0)
    )
   (send-super :init)
   (setq _vel (float __vel))
   (setq _omega (float __omega))
   self)
  (:vel
   (&optional __vel)
   (if __vel (setq _vel __vel)) _vel)
  (:omega
   (&optional __omega)
   (if __omega (setq _omega __omega)) _omega)
  (:serialization-length
   ()
   (+
    ;; float32 _vel
    4
    ;; float32 _omega
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vel
       (sys::poke _vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _omega
       (sys::poke _omega (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vel
     (setq _vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _omega
     (setq _omega (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mario_kart::itemResponse
  :super ros::object
  :slots (_cmd ))

(defmethod mario_kart::itemResponse
  (:init
   (&key
    ((:cmd __cmd) (instance geometry_msgs::Twist :init))
    )
   (send-super :init)
   (setq _cmd __cmd)
   self)
  (:cmd
   (&rest __cmd)
   (if (keywordp (car __cmd))
       (send* _cmd __cmd)
     (progn
       (if __cmd (setq _cmd (car __cmd)))
       _cmd)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Twist _cmd
    (send _cmd :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Twist _cmd
       (send _cmd :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Twist _cmd
     (send _cmd :deserialize buf ptr-) (incf ptr- (send _cmd :serialization-length))
   ;;
   self)
  )

(defclass mario_kart::item
  :super ros::object
  :slots ())

(setf (get mario_kart::item :md5sum-) "081833b8303250abb8d3090d1d3e17e7")
(setf (get mario_kart::item :datatype-) "mario_kart/item")
(setf (get mario_kart::item :request) mario_kart::itemRequest)
(setf (get mario_kart::item :response) mario_kart::itemResponse)

(defmethod mario_kart::itemRequest
  (:response () (instance mario_kart::itemResponse :init)))

(setf (get mario_kart::itemRequest :md5sum-) "081833b8303250abb8d3090d1d3e17e7")
(setf (get mario_kart::itemRequest :datatype-) "mario_kart/itemRequest")
(setf (get mario_kart::itemRequest :definition-)
      "# Request message types
float32 vel
float32 omega

---
# Response message types
geometry_msgs/Twist cmd


================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")

(setf (get mario_kart::itemResponse :md5sum-) "081833b8303250abb8d3090d1d3e17e7")
(setf (get mario_kart::itemResponse :datatype-) "mario_kart/itemResponse")
(setf (get mario_kart::itemResponse :definition-)
      "# Request message types
float32 vel
float32 omega

---
# Response message types
geometry_msgs/Twist cmd


================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")



(provide :mario_kart/item "081833b8303250abb8d3090d1d3e17e7")


