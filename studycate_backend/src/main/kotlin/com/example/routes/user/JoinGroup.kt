package com.example.routes.user

import com.example.dao.userService
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.joinGroupRoute() {
    post("/joinGroup") {
        try {
            val req = call.receive<JoinGroupRequest>()
            val res = userService.joinGroup(req.userId, req.groupId)
            call.respond(res)
        } catch (e: ContentTransformationException) {
            call.respondText("Invalid Arguments")
        } catch (e: Exception) {
            call.respondText(e.message ?: "Something went wrong")
        }
    }
}

data class JoinGroupRequest(
    val userId: String,
    val groupId: String
)