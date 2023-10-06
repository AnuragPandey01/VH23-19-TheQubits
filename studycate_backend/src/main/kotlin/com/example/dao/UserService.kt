package com.example.dao

import com.example.dao.DatabaseFactory.dbQuery
import com.example.model.*
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import java.util.*

class UserService {

    suspend fun create(user: SignupUser): User = dbQuery {
        Users.insert {
            it[firstName] = user.firstName
            it[lastName] = user.lastName
            it[email] = user.email
            it[institutionName] = user.institutionName
            it[isClgStud] = user.isClgStud
            it[grade] = user.grade
            it[branch] = user.branch
            it[year] = user.year
            it[password] = user.password
            it[profileUrl] = "https://api.dicebear.com/7.x/initials/png?seed=${user.firstName} ${user.lastName}"
        }.resultedValues?.singleOrNull()?.let { resultRowToUser(it) } ?: error("User Already Exists")
    }

    suspend fun login(user: SignupUser): User = dbQuery {
        Users.select { Users.email eq user.email and (Users.password eq user.password) }
            .mapNotNull { resultRowToUser(it) }
            .singleOrNull() ?: error("User doesn't exist or password is incorrect")
    }


    suspend fun delete(id: Int) = dbQuery {
        Users.deleteWhere {
            Users.id eq UUID.fromString(id.toString())
        }
    }

    suspend fun getUserChatGroups(userId : String) = dbQuery {

        UserGroupsMapping.innerJoin(ChatGroups).slice(
            UserGroupsMapping.groupId,
            ChatGroups.groupName,
            ChatGroups.groupDescription,
            ChatGroups.groupIcon,
            ChatGroups.verified,
            ChatGroups.members
        ).select {
            UserGroupsMapping.userId eq UUID.fromString(userId)
        }.mapNotNull { resultRowToGroupGlance(it) }

    }

    suspend fun exitGroup(userId : String, groupId : String) = dbQuery {
        UserGroupsMapping.deleteWhere {
            UserGroupsMapping.userId eq UUID.fromString(userId) and (UserGroupsMapping.groupId eq UUID.fromString(groupId))
        }
    }

    suspend fun joinGroup(userId : String, groupId : String) = dbQuery {
        UserGroupsMapping.insert {
            it[UserGroupsMapping.userId] = UUID.fromString(userId)
            it[UserGroupsMapping.groupId] = UUID.fromString(groupId)
            it[UserGroupsMapping.isAdmin] = false
            it[UserGroupsMapping.isCreator] = false
            it[UserGroupsMapping.isMember] = true
        }
    }

    private fun resultRowToUser(it : ResultRow) = User(
        id = it[Users.id].toString(),
        firstName = it[Users.firstName],
        lastName = it[Users.lastName],
        email = it[Users.email],
        institutionName = it[Users.institutionName],
        isClgStud = it[Users.isClgStud],
        grade = it[Users.grade],
        branch = it[Users.branch],
        year = it[Users.year],
        profileImg = it[Users.profileUrl]
    )
}

val userService = UserService()

