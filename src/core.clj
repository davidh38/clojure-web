(ns core
  (:require [ring.adapter.jetty :refer [run-jetty]]))

(defn handler [_]
  {:status 200
   :headers {"Content-Type" "text/plain"}
   :body "hello"})

;; start server (non-blocking)
(defn run [_]
    (run-jetty handler {:port 3000 :join? false})

  )
