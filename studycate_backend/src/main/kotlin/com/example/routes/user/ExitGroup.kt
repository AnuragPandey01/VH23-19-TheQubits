package com.example.routes.user

import com.example.dao.userService
import com.example.util.badReqRes
import com.example.util.okRes
import com.example.util.serverErrRes
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.routing.*

fun Route.exitGroupRoute(){

    post ("/exitGroup"){
        try{
            val req = call.receive<ExitGroupRequest>()
            userService.exitGroup(userId = req.id, groupId = req.groupId)
            call.okRes("Successfully exited group")
        }catch (e: IllegalArgumentException){
            call.badReqRes(e.message?:"Invalid Arguments")
        }catch (e:ContentTransformationException){
            call.badReqRes("Invalid Arguments")
        }catch (e: Exception){
            call.serverErrRes( "Something went wrong")
        }
    }
}

data class ExitGroupRequest(
    val id: String,
    val groupId: String
)