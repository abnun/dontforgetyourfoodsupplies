package de.webmpuls.dontforgetyourfoodsupplies

class SettingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        //params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [settingInstanceList: Setting.list(params), settingInstanceTotal: Setting.count()]
    }

    def create = {
        def settingInstance = new Setting()
        settingInstance.properties = params
        return [settingInstance: settingInstance]
    }

    def save = {
        def settingInstance = new Setting(params)
        if (settingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'setting.label', default: 'Setting'), settingInstance.id])}"
            redirect(action: "show", id: settingInstance.id)
        }
        else {
            render(view: "create", model: [settingInstance: settingInstance])
        }
    }

    def show = {
        def settingInstance = Setting.get(params.id)
        if (!settingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'setting.label', default: 'Setting'), params.id])}"
            redirect(action: "list")
        }
        else {
            [settingInstance: settingInstance]
        }
    }

    def edit = {
        def settingInstance = Setting.get(params.id)
        if (!settingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'setting.label', default: 'Setting'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [settingInstance: settingInstance]
        }
    }

    def update = {
        def settingInstance = Setting.get(params.id)
        if (settingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (settingInstance.version > version) {
                    
                    settingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'setting.label', default: 'Setting')] as Object[], "Another user has updated this Setting while you were editing")
                    render(view: "edit", model: [settingInstance: settingInstance])
                    return
                }
            }
            settingInstance.properties = params
            if (!settingInstance.hasErrors() && settingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'setting.label', default: 'Setting'), settingInstance.id])}"
                redirect(action: "show", id: settingInstance.id)
            }
            else {
                render(view: "edit", model: [settingInstance: settingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'setting.label', default: 'Setting'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def settingInstance = Setting.get(params.id)
        if (settingInstance) {
            try {
                settingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'setting.label', default: 'Setting'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'setting.label', default: 'Setting'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'setting.label', default: 'Setting'), params.id])}"
            redirect(action: "list")
        }
    }
}
