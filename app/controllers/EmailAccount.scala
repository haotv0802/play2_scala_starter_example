package controllers

import scala.beans.BeanProperty

class EmailAccount {
  var username: String = "Hao"
  var password: String = "Hiep"
  override def toString = "Email Account: ($username, $password)"
}