package com.example.dao

import com.example.dao.DatabaseFactory.dbQuery
import com.example.model.Sessions
import com.example.model.resultRowToSession
import com.example.routes.session.CreateSessionRequest
import org.jetbrains.exposed.sql.SqlExpressionBuilder
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.deleteWhere
import org.jetbrains.exposed.sql.insert
import org.jetbrains.exposed.sql.update
import java.util.*

class SessionService {

    suspend  fun create(req: CreateSessionRequest)= dbQuery {
        Sessions.insert {
            it[startTime] = req.startTime
            it[endTime] = req.endTime
            it[groupId] = UUID.fromString(req.groupId)
            it[members] = 1
        }.resultedValues?.singleOrNull()?.let { resultRowToSession(it) } ?: error("Session Already Exists")
    }

    suspend fun delete(groupId: String) = dbQuery {
        Sessions.deleteWhere {
            Sessions.groupId eq UUID.fromString(groupId)
        }
    }

    suspend fun join(groupId: String) = dbQuery {

        Sessions.update({ Sessions.groupId eq UUID.fromString(groupId) }) {
            with(SqlExpressionBuilder) {
                it.update(members, members + 1)
            }
        }
    }

    suspend fun leave(groupId: String) = dbQuery {
        Sessions.update({ Sessions.groupId eq UUID.fromString(groupId) }) {
            with(SqlExpressionBuilder) {
                it.update(members, members - 1)
            }
        }
    }
}

val sessionService = SessionService()