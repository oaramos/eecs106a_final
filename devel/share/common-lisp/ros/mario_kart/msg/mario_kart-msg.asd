
(cl:in-package :asdf)

(defsystem "mario_kart-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "positions" :depends-on ("_package_positions"))
    (:file "_package_positions" :depends-on ("_package"))
  ))