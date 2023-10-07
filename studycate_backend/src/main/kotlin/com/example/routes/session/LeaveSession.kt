package com.example.routes.session

import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.leaveSession(){
    post("/leave"){
        val req = call.receive<LeaveSessionRequest>()
        call.respond("Leaving session ${req.groupId}")
    }
}

data class LeaveSessionRequest(
    val groupId: String,
    val userId: String
)