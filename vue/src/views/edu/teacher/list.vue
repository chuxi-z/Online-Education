<template>
    <div class="app-container">
     
    <el-form :inline="true" class="demo-form-inline">
      <el-form-item>
        <el-input v-model="teacherQuery.name" placeholder="Teacher Name"/>
      </el-form-item>

      <el-form-item>
        <el-select v-model="teacherQuery.level" clearable placeholder="Teacher Career">
          <el-option :value="1" label="Super"/>
          <el-option :value="2" label="High"/>
        </el-select>

      </el-form-item>
      <el-form-item label="Create Time">
        <el-date-picker
          v-model="teacherQuery.begin"
          type="datetime"
          placeholder="Please Choose Start Time"
          value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00"
        />
      </el-form-item>

      <el-form-item>
        <el-date-picker
          v-model="teacherQuery.end"
          type="datetime"
          placeholder="Please Choose End Time"
          value-format="yyyy-MM-dd HH:mm:ss"
          default-time="00:00:00"
        />

      </el-form-item>
      <el-button type="primary" icon="el-icon-search" @click="getList()">Search</el-button>
      <el-button type="default" @click="resetData()">Clear</el-button>
    </el-form>
    
    <el-table
      :data="list"
      element-loading-text="Loading"
      border
      fit
      highlight-current-row>
      <el-table-column
        label="id"
        width="70"
        align="center">
        <template slot-scope="scope">
          {{ (page - 1) * limit + scope.$index + 1 }}
        </template>
      </el-table-column>
      <el-table-column prop="name" label="Name" width="80" />
      <el-table-column label="Career" width="80">
        <template slot-scope="scope">
          {{ scope.row.level===1?'Super':'High' }}
        </template>
      </el-table-column>
      <el-table-column prop="intro" label="Introduction" />
      <el-table-column prop="gmtCreate" label="Create Time" width="160"/>
      <el-table-column prop="sort" label="Sort" width="60" />
      <el-table-column label="Options" width="200" align="center">
        <template slot-scope="scope">
          <router-link :to="'/teacher/save/'+scope.row.id">
            <el-button type="primary" size="mini" icon="el-icon-edit">Edit</el-button>
          </router-link>
          <el-button type="danger" size="mini" icon="el-icon-delete" @click="removeDataById(scope.row.id)">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
      :current-page="page"
      :page-size="limit"
      :total="total"
      style="padding: 30px 0; text-align: center;"
      layout="total, prev, pager, next, jumper"
      @current-change="getList"
    />

    </div>
</template>

<script>
import teacher from '@/api/edu/teacher'
export default {
    data(){
        return{
            list:null,
            page:1,
            limit:5,
            total:0,
            teacherQuery:{}
        }
    },
    created(){
        this.getList()
    },
    methods:{
        getList(page = 1){
            this.page = page
            teacher.getTeacherListPage(this.page, this.limit, this.teacherQuery)
            .then(response=>{
                this.list = response.data.rows
                this.total = response.data.total
                //console.log(this.list)
                //console.log(this.total)
            })
            .catch(error=>{
                console.log(error)
            })
        },
        resetData(){
            this.teacherQuery = {}
            this.getList()
        },
        removeDataById(id){
          this.$confirm('continue?','Prompt message',{
            confirmButtonText:'yes',
            cancelButtonText:'no',
            type:'warning'
          }).then(()=>{
            teacher.deleteTeacherId(id)
              .then(response=>{
              this.$message({
                type:'success',
                message:'successful!'
              });
              this.getList()
          })
            
          })
        }
    }
    
}
</script>