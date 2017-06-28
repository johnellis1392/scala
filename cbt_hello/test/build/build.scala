package hello_build.test
import cbt._


class Build(val context: Context) extends BaseBuild{

  override def dependencies = (
    super.dependencies ++
    Seq(
      DirectoryDependency(projectDirectory ++ "/..")
    ) ++
    Resolver(mavenCentral, sonatypeReleases).bind(
      ScalaDependency("com.lihaoyi", "ammonite-ops", "0.5.5"),
      ScalaDependency("org.scalactic", "scalactic", "3.0.1"),
      ScalaDependency("org.scalatest", "scalatest", "3.0.1")
    )
  )

  // def runTests = {
  //   println("Hello, World!")
  // }

}
