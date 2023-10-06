package com.example.routes.user

import com.example.dao.userService
import com.example.model.SignupUser
import com.example.util.badReqRes
import com.example.util.okRes
import com.example.util.serverErrRes
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.routing.*

fun Route.loginUserRoute(){

    post ("/login"){
        try{
            val signupUser = call.receive<SignupUser>()
            val user = userService.login(signupUser)
            call.okRes(user)
        }catch (e: IllegalArgumentException){
            call.badReqRes(e.message?:"Invalid Arguments")
        }catch (e:ContentTransformationException){
            call.badReqRes("Invalid Arguments")
        }catch (e: Exception){
            call.serverErrRes( "Something went wrong")
        }
    }

}