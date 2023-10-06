package com.example.routes.user

import com.example.dao.userService
import com.example.plugins.SignupUser
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.registerUserRoutes(){

    post ("/register"){
        val signupUser = call.receive<SignupUser>()
        val resUser = userService.create(signupUser)
        call.respond(resUser)
    }
}