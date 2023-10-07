package com.example.routes.session

import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.joinSession(){
    post("/join"){
         val req = call.receive<JoinSessionRequest>()
         call.respond("Joining session ${req.groupId}")
    }
}

data class JoinSessionRequest(
    val groupId: String,
    val userId: String
)
