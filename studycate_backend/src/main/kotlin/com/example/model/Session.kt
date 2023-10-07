package com.example.model

import org.jetbrains.exposed.dao.id.UUIDTable
import org.jetbrains.exposed.sql.ResultRow

data class Session(
    val id: String,
    val startTime: String,
    val endTime: String,
    val groupId: String,
    val members: Int
)

object Sessions: UUIDTable(){
    val startTime = text("startTime")
    val endTime = text("endTime")
    val groupId = reference("groupId", ChatGroups.id)
    val members = integer("members").default(1)
}

fun resultRowToSession(it : ResultRow) = Session(
    id = it[Sessions.id].toString(),
    startTime = it[Sessions.startTime],
    endTime = it[Sessions.endTime],
    groupId = it[Sessions.groupId].toString(),
    members = it[Sessions.members]
)