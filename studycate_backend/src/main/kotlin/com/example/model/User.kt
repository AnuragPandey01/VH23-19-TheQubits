package com.example.model

import kotlinx.serialization.Serializable
import org.jetbrains.exposed.dao.id.UUIDTable

@Serializable
data class SignupUser(
    val firstName: String,
    val lastName: String,
    val email: String,
    val institutionName  : String,
    val isClgStud: Boolean,
    val grade: Int?,
    val branch : String?,
    val year : Int?,
    val password: String
)

data class User(
    val id: String,
    val firstName: String,
    val lastName: String,
    val email: String,
    val profileImg: String,
    val institutionName  : String,
    val isClgStud: Boolean,
    val grade: Int?,
    val branch : String?,
    val year : Int?,
)

object Users : UUIDTable() {
    val firstName = varchar("first_name", length = 50)
    val lastName = varchar("last_name", length = 50 )
    val email = varchar("email", length = 50).uniqueIndex()
    val institutionName = varchar("institutionName", length = 50)
    val isClgStud = bool("isClgStud")
    val grade = integer("grade").nullable()
    val branch = varchar("branch", length = 50).nullable()
    val year = integer("year").nullable()
    val password = varchar("password", length = 50)
    val profileUrl = varchar("profileUrl", length = 50).default("https://api.dicebear.com/7.x/fun-emoji/png")
}

object UserGroupsMapping : UUIDTable() {
    val userId = reference("userId", Users.id)
    val groupId = reference("groupId", ChatGroups.id)
    val isAdmin = bool("isAdmin").default(false)
    val isCreator = bool("isCreator").default(false)
    val isMember = bool("isMember").default(false)
}
