enablePlugins(SbtWeb)

lazy val js = project

scalaJSProjects += js

pipelineStages in Assets += scalaJSPipeline

scalaVersion in Global := "2.11.8"

scalacOptions in Global += "-optimise"
scalacOptions in Global ++= Seq("-Xmax-classfile-name","78")
