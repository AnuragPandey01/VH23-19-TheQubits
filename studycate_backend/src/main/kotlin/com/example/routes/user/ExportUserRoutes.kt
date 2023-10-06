package com.example.routes.user

import io.ktor.server.routing.*

fun Route.exportUserRoutes() {
    route("/user") {
        registerUserRoutes()
        loginUserRoute()
    }
}