package com.example.routes.groups

import io.ktor.server.routing.*

fun Route.groupRoutes(){
    route("/group"){
        createGroupRoute()
        /*getGroupRoute()
        getGroupMembersRoute()
        getGroupMessagesRoute()
        getGroupChatRoute()
        updateGroupRoute()
        deleteGroupRoute()*/
    }
}