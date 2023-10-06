package com.example.routes.user

import com.example.dao.userService
import com.example.plugins.SignupUser
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.loginUserRoute(){

    post ("/login"){
        try{
            val signupUser = call.receive<SignupUser>()
            val user = userService.login(signupUser)
            call.respond(user)
        }catch (e: IllegalStateException){
            call.respond(mapOf("error" to e.message))
        }catch (e: IllegalArgumentException){
            call.respond(mapOf("error" to e.message))
        }
    }

}