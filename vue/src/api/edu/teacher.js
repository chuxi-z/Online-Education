import request from '@/utils/request'

export default{
    getTeacherListPage(current, limit, teacherQuery){
        return request({
            url: `/service_edu/edu-teacher/PageTeacherCondition/${current}/${limit}`,
            method: 'post',
            data: teacherQuery
          })
    },
    deleteTeacherId(id){
        return request({
            url: `/service_edu/edu-teacher/${id}`,
            method: 'delete'
          }) 
    },
    addTeacher(teacher){
        return request({
            url: `/service_edu/edu-teacher/addTeacher`,
            method: 'post',
            data: teacher
          }) 
    },
    getTeacherInfo(id){
        return request({
            url: `/service_edu/edu-teacher/getTeacher/${id}`,
            method: 'get'
          }) 
    },
    updateTeacherInfo(teacher) {
        return request({
            url: `/service_edu/edu-teacher/updateTeacher`,
            method: 'post',
            data: teacher
          })
    }
}
