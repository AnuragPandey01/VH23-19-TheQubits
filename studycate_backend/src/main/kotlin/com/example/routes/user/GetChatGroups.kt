package com.example.routes.user

import com.example.dao.userService
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.userChatGroups() {
    post("/chatGroups") {
        try {
            val req = call.receive<UserChatGroupsRequest>()
            val list = userService.getUserChatGroups(req.userId);
            call.respond(list)
        } catch (e: ContentTransformationException) {
            call.respondText("Invalid Arguments")
        } catch (e: Exception) {
            call.respondText(e.message ?: "Something went wrong")
        }
    }
}

data class UserChatGroupsRequest(
    val userId: String
)