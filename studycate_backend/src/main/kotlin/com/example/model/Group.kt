package com.example.model

import org.jetbrains.exposed.dao.id.UUIDTable
import org.jetbrains.exposed.sql.ResultRow
import org.jetbrains.exposed.sql.javatime.datetime
import java.time.LocalDateTime

data class GroupGlance(
    val id: String,
    val name: String,
    val description: String,
    val members: Int,
    val grpIcon: String,
    val verified : Boolean,
    val createdAt : LocalDateTime
)

fun resultRowToGroupGlance(it : ResultRow) = GroupGlance(
    id = it[UserGroupsMapping.groupId].toString(),
    name = it[ChatGroups.groupName],
    description = it[ChatGroups.groupDescription],
    members = it[ChatGroups.members],
    grpIcon = it[ChatGroups.groupIcon],
    verified = it[ChatGroups.verified],
    createdAt = it[ChatGroups.createdAt]
)

object ChatGroups : UUIDTable() {
    val groupName = varchar("group_name", 255)
    val groupDescription = varchar("group_description", 255)
    val groupIcon = varchar("group_icon", 255)
    val verified = bool("verified").default(false)
    val members = integer("members").default(1)
    val creator = reference("creator", Users.id)
    val createdAt =  datetime("created_at").clientDefault { LocalDateTime.now() }
}
