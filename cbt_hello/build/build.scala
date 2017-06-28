package hello_build

// import hello_build.test._
import cbt._


class Build(val context: Context) extends BaseBuild{

  override def dependencies = (
    super.dependencies ++
    Seq(
      // DirectoryDependency( projectDirectory ++ "/subProject" )
    ) ++
    Resolver(mavenCentral, sonatypeReleases).bind(
      ScalaDependency("com.lihaoyi", "ammonite-ops", "1.0.0-RC9")
    )
  )

  // An example task definition
  def exampleTask = {
      println("Running example task")
  }

  // Run Tests
  // def runTests() = {
  //   Build.runTests
  // }

}
