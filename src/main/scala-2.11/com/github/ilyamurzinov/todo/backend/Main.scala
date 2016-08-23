package com.github.ilyamurzinov.todo.backend

import java.util.UUID

import com.twitter.finagle.{Http, Service}
import com.twitter.finagle.http.{Request, Response}
import com.twitter.util.Await
import io.circe.generic.auto._
import io.finch._
import io.finch.circe._

object Main {
  val port = System.getProperty("port")

  val hello: Endpoint[String] = get(/) {
    Ok("Hello World!")
  }

  def main(args: Array[String]): Unit = {
    Await.ready(Http.server.serve(s"0.0.0.0:$port", hello.toService))
  }
}
