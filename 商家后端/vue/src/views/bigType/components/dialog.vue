<template>
  <el-dialog
      model-value="dialogVisible"
      :title="dialogTitle"
      width="40%"
      @close="handleClose"
  >
    <el-form
        ref="formRef"
        :model="form"
        :rules="rules"
        label-width="150px"
    >
      <el-form-item label="大类名称" prop="name">
        <el-input v-model="form.name"/>
      </el-form-item>
      <el-form-item label="大类描述" prop="remark">
        <el-input v-model="form.remark" type="textarea" :rows="4"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取消</el-button>
        <el-button @click="handleConfirm" type="primary">确认</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup>

import {defineEmits, defineProps, ref, watch} from "vue";
import {ElMessage, ElMessageBox} from 'element-plus'

import axios from "@/utils/axios";

const tableData = ref([])

const form = ref({
  id: -1,
  name: "",
  remark: "",
})

const rules = ref({
  name: [
    {required: true, message: '请输入商品大类名称'}
  ],
  remark: [
    {required: true, message: '请输入商品大类描述'}
  ],
})

const formRef = ref(null)

const initFormData = async (id) => {
  const res = await axios.get("admin/bigType/" + id);
  form.value = res.data.bigType;
}

const props = defineProps(
    {
      id: {
        type: Number,
        default: -1,
        required: true
      },
      dialogTitle: {
        type: String,
        default: '',
        required: true
      },
      dialogVisible: {
        type: Boolean,
        default: true,
        required: true
      }
    }
)

watch(
    () => props.dialogVisible,
    () => {
      let id = props.id;
      if (id != -1) {
        initFormData(id)
      } else {
        //重置信息
        formRef.value.resetFields();
        form.value = {
          id: -1,
          name: "",
          remark: ""
        }
      }
    }
)


const emits = defineEmits(['update:modelValue', 'initBigTypeList'])

const handleClose = () => {
  emits('update:modelValue', false)
}
const handleConfirm = () => {
  formRef.value.validate(async (valid) => {
    if (valid) {
      let result = await axios.post("admin/bigType/save", form.value);
      let data = result.data;
      if (data.code == 0) {
        ElMessage.success("修改成功")
        formRef.value.resetFields();
        emits("initBigTypeList")
        handleClose();
      } else {
        ElMessage.error(data.msg)
      }
    } else {
      console.log("fail")
    }
  })
}

</script>

<style scoped>

</style>