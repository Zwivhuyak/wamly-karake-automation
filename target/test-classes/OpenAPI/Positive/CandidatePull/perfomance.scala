package OpenAPI.Positive.CandidatePull


import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration._
import scala.language.postfixOps

class CatsSimulation extends Simulation {

  val protocol = karateProtocol(
    "/cats/{id}" -> Nil,
    "/cats" -> pauseFor("get" -> 15, "post" -> 25)
  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  protocol.runner.karateEnv("perf")


  val IG = scenario("GetIG").exec(karateFeature("classpath:Daisy/request.feature"))



  setUp(
    IG.inject(rampUsers(3) during(60 seconds)).protocols(protocol)

  )

}