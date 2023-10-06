package com.example.dao

import com.example.dao.DatabaseFactory.dbQuery
import com.example.model.ChatGroups
import com.example.model.UserGroupsMapping
import com.example.model.resultRowToGroupGlance
import com.example.routes.groups.CreateGroupRequest
import org.jetbrains.exposed.sql.and
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.select
import java.util.*

class GroupsService {

    suspend fun createGroup(grp: CreateGroupRequest) = dbQuery {

        val membersCount = grp.members.size + 1
        val createdGrp = ChatGroups.insert {
            it[groupName] = grp.name
            it[groupDescription] = grp.desc
            it[groupIcon] = "https://api.dicebear.com/7.x/initials/png?seed=${grp.name}"
            it[creator] = UUID.fromString(grp.adminId)
            it[members] = membersCount
            it[verified] = false
        }.resultedValues?.singleOrNull()?.let { resultRowToGroupGlance(it) } ?: error("Group Creation Failed")

        for(member in grp.members){
            UserGroupsMapping.insert {
                it[userId] = UUID.fromString(member)
                it[groupId] = UUID.fromString(createdGrp.id)
            }
        }
    }

    suspend fun getGroupDetails(groupId : String) = dbQuery {
        val chatGrp = ChatGroups
            .select { ChatGroups.id eq UUID.fromString(groupId) }
            .mapNotNull { resultRowToGroupGlance(it) }
            .singleOrNull() ?: error("Group doesn't exist")

        val members = UserGroupsMapping.select { UserGroupsMapping.groupId eq UUID.fromString(groupId) }
            .mapNotNull { it[UserGroupsMapping.userId].toString() }

        val admin = UserGroupsMapping
            .select {
                UserGroupsMapping.groupId eq UUID.fromString(groupId) and (UserGroupsMapping.isAdmin eq true)
            }
            .mapNotNull { it[UserGroupsMapping.userId].toString() }

        object{
            val detail = chatGrp
            val members = members
            val admin = admin
        }
    }
}

val groupService = GroupsService()