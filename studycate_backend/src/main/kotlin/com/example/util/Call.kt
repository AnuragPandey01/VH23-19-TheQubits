package com.example.util

import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*

suspend fun ApplicationCall.serverErrRes(msg: String) =
    this.respond(status = HttpStatusCode.InternalServerError, mapOf("error" to msg))

suspend fun ApplicationCall.badReqRes(msg: String) =
    this.respond(status = HttpStatusCode.BadRequest, mapOf("msg" to msg))

suspend fun ApplicationCall.okRes(msg: String) =
    this.respond(status = HttpStatusCode.OK, mapOf("msg" to msg))

suspend fun ApplicationCall.okRes(msg: Any) =
    this.respond(status = HttpStatusCode.OK, msg)

suspend fun ApplicationCall.createdRes(msg : Any) =
    this.respond(status = HttpStatusCode.Created, msg)