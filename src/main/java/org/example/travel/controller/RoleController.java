package org.example.travel.controller;


import org.example.travel.entity.Role;
import org.example.travel.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/admin/role")
    public String role(Model model) {
        model.addAttribute("roles", roleService.getAllRoles());
        return "role/list";
    }

    @GetMapping("/admin/role/add")
    public String addRole() {
        return "role/add";
    }

    @GetMapping("/admin/role/edit")
    public String editRole(Model model, @RequestParam("id") Long id) {
        model.addAttribute("role", roleService.getRoleById(id));
        return "role/edit";
    }

    @GetMapping("/admin/role/delete")
    public String deleteRole(@RequestParam("id") Long id) {
        roleService.deleteRole(id);
        return "redirect:/admin/role";
    }

    @PostMapping("/admin/role/add")
    public String processAdd(Role role) {
        roleService.saveRole(role);
        return "redirect:/admin/role";
    }

    @PostMapping("/admin/role/update")
    public String processEdit(Role role) {
        roleService.saveRole(role);
        return "redirect:/admin/role";
    }
}
