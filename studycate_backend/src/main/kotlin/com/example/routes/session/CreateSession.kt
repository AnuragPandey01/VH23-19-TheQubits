package com.example.routes.session

import com.example.dao.sessionService
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.createSession() {

    post("/create") {
        val request = call.receive<CreateSessionRequest>()
        call.respond(sessionService.create(request))
    }
}

data class CreateSessionRequest(
    val startTime: String,
    val endTime: String,
    val groupId: String,
    val userId: String
)