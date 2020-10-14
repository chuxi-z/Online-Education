package com.web.aclservice.controller;


import com.web.aclservice.entity.Permission;
import com.web.aclservice.service.PermissionService;
import com.web.commonutils.RParadigm;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 权限 菜单管理
 * </p>
 *
 * @author testjava
 * @since 2020-01-12
 */
@RestController
@RequestMapping("/admin/acl/permission")
//@CrossOrigin
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    //获取全部菜单
    @ApiOperation(value = "查询所有菜单")
    @GetMapping
    public RParadigm indexAllPermission() {
        List<Permission> list =  permissionService.queryAllMenuGuli();
        return RParadigm.ok().data("children",list);
    }

    @ApiOperation(value = "递归删除菜单")
    @DeleteMapping("remove/{id}")
    public RParadigm remove(@PathVariable String id) {
        permissionService.removeChildByIdGuli(id);
        return RParadigm.ok();
    }

    @ApiOperation(value = "给角色分配权限")
    @PostMapping("/doAssign")
    public RParadigm doAssign(String roleId,String[] permissionId) {
        permissionService.saveRolePermissionRealtionShipGuli(roleId,permissionId);
        return RParadigm.ok();
    }

    @ApiOperation(value = "根据角色获取菜单")
    @GetMapping("toAssign/{roleId}")
    public RParadigm toAssign(@PathVariable String roleId) {
        List<Permission> list = permissionService.selectAllMenu(roleId);
        return RParadigm.ok().data("children", list);
    }



    @ApiOperation(value = "新增菜单")
    @PostMapping("save")
    public RParadigm save(@RequestBody Permission permission) {
        permissionService.save(permission);
        return RParadigm.ok();
    }

    @ApiOperation(value = "修改菜单")
    @PutMapping("update")
    public RParadigm updateById(@RequestBody Permission permission) {
        permissionService.updateById(permission);
        return RParadigm.ok();
    }

}

