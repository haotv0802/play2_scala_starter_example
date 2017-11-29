//package controllers
//
//import javax.inject.Inject
//
//import play.api.db._
//import play.api.mvc._
//
//@Singleton
//class UserController @Inject()(db: Database, val cc: ControllerComponents)  extends AbstractController(cc){
//
//  def index = Action {
//    var outString = "Number is "
//    val conn = db.getConnection()
//
//    try {
//      val stmt = conn.createStatement
//      val rs = stmt.executeQuery("SELECT email FROM aspire_users WHERE password = 'pass' ")
//
//      while (rs.next()) {
//        outString += rs.getString("email")
//      }
//    } finally {
//      conn.close()
//    }
//    Ok(outString)
//  }
//}
