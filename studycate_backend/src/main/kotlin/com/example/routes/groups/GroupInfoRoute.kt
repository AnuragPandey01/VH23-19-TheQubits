package com.example.routes.groups

import com.example.dao.groupService
import com.example.util.okRes
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.routing.*

fun Route.groupInfoRoute(){
    post("/info") {
        val req = call.receive<GroupInfoRequest>()
        val details = groupService.getGroupDetails(req.groupId)
        call.okRes(details)
    }
}

data class GroupInfoRequest(
    val groupId: String
)