name := "play2_scala_starter_example"
 
version := "1.0" 
      
lazy val `play2_scala_starter_example` = (project in file(".")).enablePlugins(PlayScala)

resolvers += "scalaz-bintray" at "https://dl.bintray.com/scalaz/releases"
      
resolvers += "Akka Snapshot Repository" at "http://repo.akka.io/snapshots/"
      
scalaVersion := "2.12.2"

libraryDependencies ++= Seq( jdbc , ehcache , ws , specs2 % Test , guice , "com.google.code.gson" % "gson" % "2.2.4",
  "mysql" % "mysql-connector-java" % "5.1.41")

unmanagedResourceDirectories in Test <+=  baseDirectory ( _ /"target/web/public/test" )