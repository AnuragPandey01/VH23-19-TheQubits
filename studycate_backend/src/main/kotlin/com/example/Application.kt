package com.example

import com.example.dao.DatabaseFactory
import com.example.plugins.configureMonitoring
import com.example.plugins.configureRouting
import com.example.plugins.configureSerialization
import io.ktor.server.application.*

fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

fun Application.module() {

    DatabaseFactory.init(
        driverClassName = "org.postgresql.Driver",
        jdbcUrl = environment.config.property("db.url").getString(),
    )
    configureMonitoring()
    configureSerialization()
    configureRouting()
}
