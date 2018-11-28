;;;; -*- Mode: Lisp; indent-tabs-mode: nil -*-

(defsystem "cserial-port"
  :description "library for serial communication inspired by lispworks' serial-port"
  :author "Masatoshi SANO <snmsts@gmail.com>"
  :version "0.0.3"
  :licence "MIT"
  :defsystem-depends-on ("trivial-features"
                         "cffi-grovel")
  :depends-on ("trivial-features"
               "trivial-gray-streams"
               "cffi"
               (:feature (:not :windows) "cffi-grovel")
               (:feature (:not :windows) "osicat"))
  :serial t
  :components
  ((:module "src"
            :components
            ((:file "package")
             (:file "interfaces")
             (:cffi-grovel-file "ffi-types" :if-feature (:not :windows)
              :pathname "ffi-types-unix")
             (:file "posix" :if-feature (:not :windows))
             (:file "win32" :if-feature :windows)
             (:file "main")
             (:file "gray")))))
