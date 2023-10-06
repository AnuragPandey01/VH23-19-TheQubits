package com.example.dao

import com.example.dao.DatabaseFactory.dbQuery
import com.example.plugins.SignupUser
import com.example.plugins.User
import org.jetbrains.exposed.dao.id.UUIDTable
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import java.util.*

class UserService {

    object Users : UUIDTable() {
        val firstName = varchar("first_name", length = 50)
        val lastName = varchar("last_name", length = 50 )
        val email = varchar("email", length = 50)
        val institutionName = varchar("institutionName", length = 50)
        val isClgStud = bool("isClgStud")
        val grade = integer("grade").nullable()
        val branch = varchar("branch", length = 50).nullable()
        val year = integer("year").nullable()
        val password = varchar("password", length = 50)
        val profileUrl = varchar("profileUrl", length = 50).default("https://api.dicebear.com/7.x/fun-emoji/png")
    }

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
        }.resultedValues?.singleOrNull()?.let { resultRowToUser(it) } ?: error("No id returned")
    }

    suspend fun login(user: SignupUser): User = dbQuery {
        Users.select { Users.email eq user.email and (Users.password eq user.password) }
            .mapNotNull { resultRowToUser(it) }
            .singleOrNull() ?: error("No id returned")
    }

    //TODO
    /*suspend fun read(id: Int): ExposedUser? {
        return dbQuery {
            Users.select { Users.id eq id }
                .map { ExposedUser(it[Users.name], it[Users.age]) }
                .singleOrNull()
        }
    }*/

    /*suspend fun update(id: Int, user: ExposedUser) {
        dbQuery {
            Users.update({ Users.id eq id }) {
                it[name] = user.name
                it[age] = user.age
            }
        }
    }*/

    suspend fun delete(id: Int) = dbQuery {
        Users.deleteWhere {
            Users.id eq UUID.fromString(id.toString())
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
        groups = listOf("1", "2"),
        profileImg = it[Users.profileUrl]
    )
}

val userService = UserService()

