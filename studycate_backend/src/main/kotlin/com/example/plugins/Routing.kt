package com.example.plugins

import com.example.routes.groups.groupRoutes
import com.example.routes.session.sessionRoutes
import com.example.routes.user.exportUserRoutes
import io.ktor.server.application.*
import io.ktor.server.routing.*

fun Application.configureRouting() {
    routing {
        exportUserRoutes()
        groupRoutes()
        sessionRoutes()
    }
}
