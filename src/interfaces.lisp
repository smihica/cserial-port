(cl:in-package :cserial-port)

(defclass serial ()
  ((name :initarg :name
	 :reader serial-name
	 :documentation "Device name")
   (fd :initarg :fd
       :reader serial-fd
       :documentation "opend handle")
   (nonblocking-p :initarg :nonblocking-p
                  :reader serial-nonblocking-p
                  :documentation "fd is nonblocking or no")
   (encoding :initarg :encoding
	     :reader serial-encoding
	     :documentation "encoding")
   (baud-rate :initarg :baud-rate
	      :reader serial-baud-rate
	      :documentation "baud-rate")
   (data-bits :initarg :data-bits
              :reader serial-data-bits
              :documentation "Number of data-bits.")
   (stop-bits :initarg :stop-bits
              :accessor serial-stop-bits
              :documentation "Number of stop-bits")
   (parity :initarg :parity
	   :accessor serial-parity
	   :documentation "Parity checking."))
  (:documentation ""))

(defvar *serial-class* 'serial)

(defmacro defgeneric% (fname params &key export doc)
  `(progn
     (defgeneric ,fname ,params
       (:method ((,(first params) t) ,@(rest params))
	 (error "not yet implemented method ~A for ~A"
		',fname (type-of ,(first params))))
       ,@(when doc `((:documentation ,doc))))
     ,@(when export
	     `((export ',fname)))))

;;convert to native form.
(defgeneric% %baud-rate (class &optional baud-rate))
(defgeneric% %data-bits (class &optional data-bits))
(defgeneric% %stop-bits (class &optional stop-bits))
(defgeneric% %parity (class &optional parity))

(defgeneric% %valid-fd-p (class))
(defgeneric% %set-invalid-fd (class))
(defgeneric% %input-available-p (class))
(defgeneric% %default-name (class &optional number))

(defgeneric% %close (class))
(defgeneric% %open (class &key name))

(defgeneric% %write (class buffer write-size))
(defgeneric% %read  (class buffer buffer-size))
