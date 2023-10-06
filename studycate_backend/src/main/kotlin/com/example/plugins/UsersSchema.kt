package com.example.plugins

import kotlinx.serialization.Serializable

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
    val groups: List<String>
)
