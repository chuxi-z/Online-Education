<template>
    <div class="app-container">
        <el-form label-width="120px">
            <el-form-item label="Teacher Name">
                <el-input v-model="teacher.name"/>
            </el-form-item>

            <el-form-item label="Sort">
                <el-input-number v-model="teacher.sort" controls-position="right" :min="0"/>
            </el-form-item>

            <el-form-item label="Level">
                <el-select v-model="teacher.level" clearable placeholder="Please choose">
                <el-option :value="1" label="Super"/>
                <el-option :value="2" label="High"/>
                </el-select>
            </el-form-item>

            <el-form-item label="Career">
                <el-input v-model="teacher.career"/>
            </el-form-item>

            <el-form-item label="Introduction">
                <el-input v-model="teacher.intro" :rows="10" type="textarea"/>
            </el-form-item>

    
            <el-form-item label="Avatar">

                <!-- 头衔缩略图 -->
                <pan-thumb :image="teacher.avatar"/>
                <!-- 文件上传按钮 -->
                <el-button type="primary" icon="el-icon-upload" @click="imagecropperShow=true">更换头像
                </el-button>

                <!--
                v-show：是否显示上传组件
                :key：类似于id，如果一个页面多个图片上传控件，可以做区分
                :url：后台上传的url地址
                @close：关闭上传组件
                @crop-upload-success：上传成功后的回调 
                <input type="file" name="file"/>
                -->
                <image-cropper
                            v-show="imagecropperShow"
                            :width="300"
                            :height="300"
                            :key="imagecropperKey"
                            :url="BASE_API+'/eduoss/fileoss'"
                            field="file"
                            @close="close"
                            @crop-upload-success="cropSuccess"/>
            </el-form-item>

            <el-form-item>
                <el-button :disabled="saveBtnDisabled" type="primary" @click="saveOrUpdate">Save</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
import teacher from '@/api/edu/teacher'
import ImageCropper from '@/components/ImageCropper'
import PanThumb from '@/components/PanThumb'
export default {
    components: { ImageCropper, PanThumb },
    data(){
        return{
            teacher:{
                name: '',
                sort: 0,
                level: 1,
                career:'',
                // isDeleted: 0,
                intro: '',
                avatar: ''
            },
            imagecropperShow:false,
            imagecropperKey:0,
            BASE_API:process.env.BASE_API,
            saveBtnDisabled: false
        }
    },
    watch:{
        $route(to, from){
            this.init()
        }
    },
    created(){
        this.init()
    }, 
    methods:{
        init(){
            //console.log('created')
            if(this.$route.params && this.$route.params.id){
                const id = this.$route.params.id
                //console.log(id)
                this.getInfo(id)
            }else{
                this.teacher = {
                    isDeleted: 0,
                }
            }
        },
        saveOrUpdate(){
            if(!this.teacher.id){
                this.saveTeacher()
            }else{
                this.updateTeacher()
            }      
        },
        saveTeacher(){
            teacher.addTeacher(this.teacher)
                .then(response=>{
                    this.$message({
                        type:'success',
                        message:'successful!'
                    });
                    this.$router.push({path:'/teacher/table'})
                })
        },
        getInfo(id){
            teacher.getTeacherInfo(id)
                .then(response=>{
                    this.teacher = response.data.teacher
                })
        },
        updateTeacher(){
            teacher.updateTeacherInfo(this.teacher)
                .then(response=>{
                    this.$message({
                        type:'success',
                        message:'successful!'
                    });
                    this.$router.push({path:'/teacher/table'})
                })
        },
        close(){
            this.imagecropperShow = false
            this.imagecropperKey = this.imagecropperKey + 1
        },
        cropSuccess(data){
            console.log(data)
            this.imagecropperShow = false
            this.teacher.avatar = data.url
            this.imagecropperKey = this.imagecropperKey + 1
        },


    }
}
</script>