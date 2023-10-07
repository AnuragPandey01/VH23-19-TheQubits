package com.example.routes.session

import io.ktor.server.routing.*

fun Route.sessionRoutes(){
    route("/session"){
        joinSession()
        leaveSession()
    }
}