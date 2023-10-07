package com.example.routes.groups

import com.example.dao.groupService
import com.example.util.badReqRes
import com.example.util.okRes
import io.ktor.server.application.*
import io.ktor.server.plugins.ContentTransformationException
import io.ktor.server.request.*
import io.ktor.server.routing.*

fun Route.createGroupRoute() {
    post("/create") {
        try {
            val req = call.receive<CreateGroupRequest>()
            val group = groupService.createGroup(req)
            call.okRes(group)
        } catch (e: IllegalArgumentException) {
            call.badReqRes(e.message ?: "Invalid Arguments")
        } catch (e: ContentTransformationException) {
            call.badReqRes("Invalid Arguments")
        }
    }
}

data class CreateGroupRequest(
    val name: String,
    val desc: String,
    val adminId: String,
    val members: List<String>
)