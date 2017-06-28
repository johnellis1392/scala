organization  := "com.example"

version       := "0.1"

scalaVersion  := "2.11.6"

scalacOptions := Seq("-unchecked", "-deprecation", "-encoding", "utf8")

// libraryDependencies ++= {
//   val akkaV = "2.3.9"
//   val sprayV = "1.3.3"
//   Seq(
//     "io.spray"            %%  "spray-can"     % sprayV,
//     "io.spray"            %%  "spray-routing" % sprayV,
//     "io.spray"            %%  "spray-testkit" % sprayV  % "test",
//     "com.typesafe.akka"   %%  "akka-actor"    % akkaV,
//     "com.typesafe.akka"   %%  "akka-testkit"  % akkaV   % "test",
//     "org.specs2"          %%  "specs2-core"   % "2.3.11" % "test"
//   )
// }
// libraryDependencies += "com.ibm" %% "couchdb-scala" % "0.7.2"
// libraryDependencies ++= Seq(
//   "com.chuusai" %% "shapeless" % "2.3.2"
// )

libraryDependencies ++= {
  val akkaV = "2.3.9"
  val sprayV = "1.3.3"
  Seq(
    "io.spray"            %%  "spray-can"     % "latest.milestone",
    "io.spray"            %%  "spray-routing" % "latest.milestone",
    "io.spray"            %%  "spray-testkit" % "latest.milestone"  % "test",
    "com.typesafe.akka"   %%  "akka-actor"    % "latest.milestone",
    "com.typesafe.akka"   %%  "akka-testkit"  % "latest.milestone"  % "test",
    "org.specs2"          %%  "specs2-core"   % "latest.milestone"  % "test"
    // "io.spray"            %% "spray-routing-shapeless23" % "1.3.3"
  )
}
// libraryDependencies += "com.ibm" %% "couchdb-scala" % "latest.milestone"
// libraryDependencies ++= Seq(
//   "com.chuusai" %% "shapeless" % "latest.milestone"
// )


Revolver.settings
