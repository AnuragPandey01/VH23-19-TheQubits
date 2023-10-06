package com.example.model

data class Group(
    val id: String,
    val name: String,
    val description: String,
    val members: List<String>,
    val admins: List<String>,
    val grpIcon: String,
    val messages: List<String>,
    val isPrivate: Boolean,
)