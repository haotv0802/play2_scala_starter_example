//package controllers
//
//import org.junit.Assert.assertEquals
//import org.junit.Assert.assertTrue
//import play.mvc.Http.Status.OK
//import controllers.UserController
//import play.test.Helpers._
//import org.junit.Test
//import play.mvc.Result
//import play.twirl.api.Content
//
//class UserControllerTest {
//
//
//
//  @Test def testIndex(): Unit = {
//    val result = new UserController().index
//    assertEquals(OK, result.status)
//    assertEquals("text/html", result.contentType.get)
//    assertEquals("utf-8", result.charset.get)
//    assertTrue(contentAsString(result).contains("Welcome"))
//  }
//}
