
(cl:in-package :asdf)

(defsystem "mario_kart-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "item" :depends-on ("_package_item"))
    (:file "_package_item" :depends-on ("_package"))
  ))