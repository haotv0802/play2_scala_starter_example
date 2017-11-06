package controllers

import javax.inject._

import play.api.libs.json._
import play.api.mvc._
import services.Counter
import org.slf4j.Logger
import org.slf4j.LoggerFactory

/**
 * This controller demonstrates how to use dependency injection to
 * bind a component into a controller class. The class creates an
 * `Action` that shows an incrementing count to users. The [[Counter]]
 * object is injected by the Guice dependency injection system.
 */
@Singleton
class TestController @Inject()(cc: ControllerComponents,
                               counter: Counter) extends AbstractController(cc) {

  val logger = LoggerFactory.getLogger(classOf[TestController])


  /**
   * Create an action that responds with the [[Counter]]'s current
   * count. The result is plain text. This `Action` is mapped to
   * `GET /count` requests by an entry in the `routes` config file.
   */
  def count = Action {
    var email = new EmailAccount()
    email.username = "Hellllll"

    logger.info("Hello from the Pizza class")
    Ok("Hao Ho")
  }

}
