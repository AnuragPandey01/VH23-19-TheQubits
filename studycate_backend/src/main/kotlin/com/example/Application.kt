package com.example

import com.example.dao.DatabaseFactory
import com.example.plugins.configureMonitoring
import com.example.plugins.configureRouting
import com.example.plugins.configureSerialization
import io.github.jan.supabase.createSupabaseClient
import io.github.jan.supabase.storage.Storage
import io.ktor.server.application.*

fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

fun Application.module() {

    DatabaseFactory.init(
        driverClassName = "org.postgresql.Driver",
        jdbcUrl = environment.config.property("db.url").getString(),
    )

    val client = createSupabaseClient(
        supabaseUrl = "https://ptcnslihjbbdkevoljqc.supabase.co",
        supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB0Y25zbGloamJiZGtldm9sanFjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY1NjM0MjAsImV4cCI6MjAxMjEzOTQyMH0._fH8zWLMamtGKEZ7gQTOZRH0smpCRN77iO69t7sEc3A"
    ) {
        install(Storage) {}
    }

    configureMonitoring()
    configureSerialization()
    configureRouting()
}
